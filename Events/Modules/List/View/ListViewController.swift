//
//  ListListViewController.swift
//  EventPlanner
//
//  Created by Shemshur Oksana on 10/10/2016.
//  Copyright © 2016 Test. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, ListViewInput {

    @IBOutlet weak var tableView: UITableView!
    var presenter: ListModuleInput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "CustomCell")      //   tableView.registerReusableCell(TodayViewCell.self)
         presenter.handleViewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.indexPathsForSelectedRows?.forEach {
            tableView.deselectRow(at: $0, animated: true)
        }
    }
    // MARK: ListViewInput
    func setupInitialState() {
        
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfEvents(inSection: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as? TableViewCell
        cell?.configure(with: presenter.eventList(for: indexPath))
        return cell!
    }
    
}

// MARK: - UITableViewDelegate

//extension PatientsViewController: UITableViewDelegate {
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        presenter.handleDidSelectItem(at: indexPath)
//    }
    
//}
