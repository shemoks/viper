//
//  ListListPresenter.swift
//  EventPlanner
//
//  Created by Shemshur Oksana on 10/10/2016.
//  Copyright © 2016 Test. All rights reserved.
//
import Foundation

class ListPresenter: ListModuleInput,  ListInteractorOutput {

    weak var view: ListViewInput!
    var interactor: ListInteractorInput!
    var router: ListRouterInput!
    var events = [Event]()
      
    func handleAddEventTap(){
       router.openAddEventModule()
    }
   
    func numberOfEvents(inSection section: Int) -> Int {
        return events.count
    }
    
    func handleViewDidLoad() {
       interactor.getEvents()
    }
   
    func eventList(for indexPath: IndexPath) -> Event {
        return events[indexPath.row]
    }
   
    func setEvents(_events events: [Event]) {
        self.events = events
    }
}

