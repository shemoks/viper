//
//  ListListInteractor.swift
//  EventPlanner
//
//  Created by Shemshur Oksana on 10/10/2016.
//  Copyright © 2016 Test. All rights reserved.
//
import RealmSwift

class ListInteractor: ListInteractorInput {

    weak var presenter: ListInteractorOutput!
    var realm: Realm! = try! Realm()
    
    func getEvents() {
        let todayString = DateHelper.getStringFromDate(date: Date())
        let today = DateHelper.getDateFromString(date: todayString)
       let events = realm.objects(Event.self).filter("dueDate = %@", today)
        //filter("dueDate == \(Date())")
        presenter.setEvents(_events: Array(events))
    }
    
    func getEventsToTheNextWeek() {
        print("\(DateHelper.addValueToDate(number: 7))")
        print("\(DateHelper.addValueToDate(number: 14))")
        let events = realm.objects(Event.self).filter("dueDate > %@ AND dueDate <= %@", DateHelper.addValueToDate(number: 7),(DateHelper.addValueToDate(number: 14))).sorted(byProperty: "dueDate")
//            .filter("dueDate between %@",[(DateHelper.addValueToDate(number: 7)),(DateHelper.addValueToDate(number: 14))])
        presenter.setEventsWeek(_events: Array(events))
    }
}
