//
//  AddAddInteractor.swift
//  Events
//
//  Created by Shemshur Oksana on 11/10/2016.
//  Copyright © 2016 mozy. All rights reserved.
//
import Foundation
import RealmSwift

class AddInteractor: AddInteractorInput {
    
    weak var presenter: AddInteractorOutput!
   

    func addToDataBase(name: String, date: Date, description: String, lat: Double, long: Double) -> Bool {
        let realm = try! Realm()
        let event = Event()
        event.dueDate = date
        event.name = name
        event.descriptions = description
        event.lat = lat
        event.long = long
        if event.validate() {
            try! realm.write {
                realm.add(event)
            }
            return true
        }
        print("\(event)")
        return false
    }
}
