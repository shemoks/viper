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
    var eventsWeek = [Event]()
    
    func handleAddEventTap(getViewController: ListViewController){
       router.openAddEventModule(viewController: getViewController)
    }
   
    func numberOfEvents(inSection section: Int) -> Int {
        
        switch section {
        case 0:
            return events.count
        default:
            return eventsWeek.count
        }
    }

    func handleViewDidLoad() {
       interactor.getEvents()
       interactor.getEventsToTheNextWeek()
    }
   
    func eventList(for indexPath: IndexPath) -> Event {
        return events[indexPath.row]
    }
    
    func eventListWeek(for indexPath: IndexPath) -> Event {
        return eventsWeek[indexPath.row]
    }
   
    func setEvents(_events events: [Event]) {
      self.events = events
    }
    
    func setEventsWeek(_events events: [Event]) {
        self.eventsWeek = events
    }
}

