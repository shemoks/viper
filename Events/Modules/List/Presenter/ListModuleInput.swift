//
//  ListListModuleInput.swift
//  EventPlanner
//
//  Created by Shemshur Oksana on 10/10/2016.
//  Copyright © 2016 Test. All rights reserved.
//

import Foundation

protocol ListModuleInput: class {
    // MARK: Actions
    func handleAddEventTap()
    
    // MARK: View life cycle
    func handleViewDidLoad()
    
    // MARK: Table View
    func numberOfEvents(inSection section: Int) -> Int
    func eventList(for indexPath: IndexPath) -> Event
    func eventListWeek(for indexPath: IndexPath) -> Event
    func deleteEvent(for indexPath: IndexPath)
    func showDetail(for indexPath: IndexPath)
}

protocol ListInteractorOutput: class {
    
    func setEvents(_events: [Event])
    func setEventsWeek(_events: [Event])
}



