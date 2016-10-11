//
//  DateHelper.swift
//  EventPlanner
//
//  Created by Mac on 10/11/16.
//  Copyright © 2016 Mac. All rights reserved.
//

import Foundation
class DateHelper {
    static func getStringDateDay(date: NSDate) -> String {
        let dateString = String(describing: date)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "ddd"
        let newDate = dateFormatter.date(from: dateString)
        return String(describing: newDate)
    }
}
