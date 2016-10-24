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


class ListViewController: UIViewController, ListViewInput, TransitionHandler {

    @IBOutlet weak var openModuleAdd: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    var presenter: ListModuleInput!
    let disposeBag = DisposeBag()
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
        tableView.register(UINib(nibName: "TodayCell", bundle: nil), forCellReuseIdentifier: "TodayCell")
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
            return presenter.numberOfEvents(inSection: section)
        case 1:
            return presenter.numberOfEvents(inSection: section)
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
            let cell = tableView.dequeueReusableCell(withIdentifier: "TodayCell") as? TodayViewCell
            cell?.configure(with: presenter.eventList(for: indexPath))
            return cell!
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as? TableViewCell
            cell?.configure(with: presenter.eventListWeek(for: indexPath))
            return cell!
        }
    }
}

extension ListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
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
}

