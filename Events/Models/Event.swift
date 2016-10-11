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
}

class Event: Object {
    dynamic var name = ""
    dynamic var dueDate: NSDate = NSDate()
}
