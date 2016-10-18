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
    
    @IBOutlet weak var tableView: UITableView!
    var presenter: ListModuleInput!
    let disposeBag = DisposeBag()
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
        tableView.register(UINib(nibName: "TodayCell", bundle: nil), forCellReuseIdentifier: "TodayCell")
        presenter.handleViewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.handleViewDidLoad()
        reloadData()
    }
    @IBAction func receiveAddEventTap(_ sender: AnyObject) {
        presenter.handleAddEventTap()
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
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//         let configurationHalder = segue.destination
//        ConfigurationBlock{
//            
//        }configurationHalder.presenter
//    
//    }

    func push(viewController: UIViewController) {
       navigationController?.pushViewController(viewController, animated: true)
    }
}

