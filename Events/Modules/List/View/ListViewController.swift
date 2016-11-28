
//
//  ListListViewController.swift
//  EventPlanner
//
//  Created by Shemshur Oksana on 10/10/2016.
//  Copyright © 2016 Test. All rights reserved.
//

import UIKit
import RealmSwift
import RxSwift
import RxDataSources


class ListViewController: UIViewController, ListViewInput, TransitionHandler, UISearchResultsUpdating, UISearchBarDelegate
{
    
    @IBOutlet weak var openModuleAdd: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func scope(_ sender: AnyObject) {
        let scopeBar = sender as! UISegmentedControl
        switch scopeBar.selectedSegmentIndex {
        case 0:
            presenter.getSort(name: false, date: true)
        case 1:
            presenter.getSort(name: true, date: false)
        default:
            presenter.getSort(name: false, date: true)
        }
        reloadData()
    }
    var presenter: ListModuleInput!
    let disposeBag = DisposeBag()
    var searchController: UISearchController!
    
    var shouldShowSearchResults = false
    
    // MARK: Life cycle
    func updateSearchResults(for searchController: UISearchController) {
        let searchString = searchController.searchBar.text!
        presenter.handleViewDidLoadFilter(filter: searchString)
        let searchResultsController = searchController.searchResultsController as! UITableViewController
        searchResultsController.tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "CellWeek")
        searchResultsController.tableView.register(UINib(nibName: "TodayCell", bundle: nil), forCellReuseIdentifier: "CellToday")
        searchResultsController.tableView.reloadData()
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "CellWeek")
        tableView.register(UINib(nibName: "TodayCell", bundle: nil), forCellReuseIdentifier: "CellToday")
        let searchResultsController = UITableViewController(style: .plain)
        searchResultsController.tableView.delegate = self
        searchResultsController.tableView.dataSource = self
        searchResultsController.tableView.rowHeight = 63
        
        searchController = UISearchController(searchResultsController: searchResultsController)
        searchController.searchResultsUpdater = self
        searchController.searchBar.sizeToFit()
        searchController.searchBar.tintColor = UIColor.white
        searchController.searchBar.delegate = self
        searchController.searchBar.barTintColor = UIColor(red: (0/255.0), green: (122/255.0), blue: (255/255.0), alpha: 1.0)
        tableView.tableHeaderView?.addSubview(searchController.searchBar)
        
        definesPresentationContext = true
        
        
        presenter.handleViewDidLoad()
        
        openModuleAdd.rx.tap.asDriver().drive(onNext: {
            self.presenter.handleAddEventTap()
        }).addDisposableTo(disposeBag)
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.handleViewDidLoad()
        reloadData()
    }
    
    func reloadData() {
        tableView?.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchController.isActive = false
        //   presenter.handleViewDidLoad()
        reloadData()
    }
}


// MARK: - UITableViewDataSource

extension ListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "today"
        default:
            return "next week"
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            if !searchController.isActive{
                return presenter.numberOfEvents(inSection: section)
            } else {
                print(presenter.numberOfEventsFilter(inSection: section))
                return presenter.numberOfEventsFilter(inSection: section)
            }
        case 1:
            if !searchController.isActive{
                return presenter.numberOfEvents(inSection: section)
            } else {
                print(presenter.numberOfEventsFilter(inSection: section))
                return presenter.numberOfEventsFilter(inSection: section)
            }
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellToday", for: indexPath) as? TodayViewCell
            if !searchController.isActive {
                cell?.configure(with: presenter.eventList(for: indexPath))
            } else {
                cell?.configure(with: presenter.eventListFilter(for: indexPath))
            }
            return cell!
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellWeek", for: indexPath) as? TableViewCell
            if !searchController.isActive {
                
                cell?.configure(with: presenter.eventListWeek(for: indexPath))
            } else {
                cell?.configure(with: presenter.eventListWeekFilter(for: indexPath))
            }
            return cell!
            
        }
    }
}

extension ListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        if searchController.isActive {
            return []
        }
        switch indexPath.section {
        case 0:
            let delete = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
                self.presenter.deleteEvent(for: indexPath)
                self.reloadData()
                // delete item at indexPath
            }
            
            let share = UITableViewRowAction(style: .normal, title: "More") { (action, indexPath) in
                self.presenter.showDetail(for: indexPath)
                // share item at indexPath
            }
            share.backgroundColor = UIColor.blue
            
            return [delete, share]
            
            
        default:
            
            let delete = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
                self.presenter.deleteEvent(for: indexPath)
                self.reloadData()
            }
            
            let share = UITableViewRowAction(style: .normal, title: "More") { (action, indexPath) in
                self.presenter.showDetail(for: indexPath)
                // share item at indexPath
            }
            share.backgroundColor = UIColor.blue
            
            return [delete, share]
        }
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter.showDetail(for: indexPath)
    }
}

