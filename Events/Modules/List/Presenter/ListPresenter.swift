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
    var eventsFilter = [Event]()
    var eventsWeekFilter = [Event]()
    
    func handleAddEventTap(){
        router.openAddEventModule()
    }
    
    func numberOfEvents(inSection section: Int) -> Int {
        
        switch section {
        case 0:
            return events.count
        default:
            return eventsWeek.count
        }
    }
    
    func numberOfEventsFilter(inSection section: Int) -> Int {
        
        switch section {
        case 0:
            return eventsFilter.count
        default:
            return eventsWeekFilter.count
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
    
    func eventListFilter(for indexPath: IndexPath) -> Event {
        print(eventsFilter)
        return eventsFilter[indexPath.row]
    }
    
    func eventListWeekFilter(for indexPath: IndexPath) -> Event {
        return eventsWeekFilter[indexPath.row]
    }
    
    func setEvents(_events events: [Event]) {
        self.events = events
    }
    
    func setEventsWeek(_events events: [Event]) {
        self.eventsWeek = events
    }
    
    func showDetail(for indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            
            let currentEvent = eventList(for: indexPath)
            router.showDescription(event: currentEvent)
        default:
            let currentEvent = eventListWeek(for: indexPath)
            router.showDescription(event: currentEvent)
        }
    }
    
    func deleteEvent(for indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            let currentEvent = eventList(for: indexPath)
            interactor.deleteEventForIndex(event: currentEvent)
        default:
            let currentEvent = eventListWeek(for: indexPath)
            interactor.deleteEventForIndex(event: currentEvent)
        }
    }
    
    func handleViewDidLoadFilter(filter: String) {
        let namePredicate = NSPredicate(format: "name BEGINSWITH [c]%@",filter);
        print(namePredicate)
        self.eventsFilter = self.events.filter{namePredicate.evaluate(with: $0)}
        self.eventsWeekFilter = self.eventsWeek.filter{namePredicate.evaluate(with: $0)}
        
    }
    
    func getSort(name: Bool, date: Bool) {
        if name == true {
            self.events = self.events.sorted {$0.name < $1.name}
            self.eventsWeek = self.eventsWeek.sorted {$0.name < $1.name}
            print(events)
            print(eventsWeek)
        }
        if date == true {
            self.events = self.events.sorted{$0.dueDate.compare($1.dueDate) == ComparisonResult.orderedAscending}
            //self.events = self.events.sorted {$0.dueDate < $1.dueDate}
            self.eventsWeek = self.eventsWeek.sorted {$0.dueDate.compare($1.dueDate) == ComparisonResult.orderedAscending}
            print(events)
            print(eventsWeek)
        }
    }
}
