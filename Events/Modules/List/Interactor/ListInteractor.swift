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
        let events = realm.objects(Event.self)
        presenter.setEvents(_events: Array(events))
    }
}
