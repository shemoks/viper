//
//  Event.swift
//  EventPlanner
//
//  Created by Mac on 10/11/16.
//  Copyright © 2016 Mac. All rights reserved.
//

import Foundation
import RealmSwift


struct TodoItem {
    let dueDate : NSDate
    let name : String
    let descriptions: String
}

class Event: Object {
    dynamic var name = ""
    dynamic var dueDate: Date = Date()
    dynamic var descriptions = ""
    dynamic var lat: Double = 0.0
    dynamic var long: Double = 0.0
    dynamic var place: String = ""
   
    func validate () -> Bool {
        if name != "" {
            return true
        }
        return false
    }
}
