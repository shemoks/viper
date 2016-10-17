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
   

    func addToDataBase(name: String, date: Date) {
        let realm = try! Realm()
        let event = Event()
        event.dueDate = date
        event.name = name
        try! realm.write {
            realm.add(event)
        }
        print("\(event)")
    }
}
