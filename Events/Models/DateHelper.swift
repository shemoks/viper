//
//  DateHelper.swift
//  EventPlanner
//
//  Created by Mac on 10/11/16.
//  Copyright © 2016 Mac. All rights reserved.
//

import Foundation
import UIKit

class DateHelper {
    
    static func getDateFromString(date: String) -> Date {
        let today = Date()
        let todayString = getStringFromDate(date: today)
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            var newDate = dateFormatter.date(from: todayString)!
            if dateFormatter.date(from: date) != nil {
            newDate = dateFormatter.date(from: date)!
        }
            return newDate
    }
    
    static func getStringFromDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let newDate = dateFormatter.string(from: date)
        return newDate
    }
    
    static func addValueToDate(number: Int) -> Date {
        let today = Date()
        let tomorrow = Calendar.current.date(byAdding: .day, value: number, to: today)
        let newDateString = getStringFromDate(date: tomorrow!)
        let newDate = getDateFromString(date: newDateString)
        return newDate
    }
    
    static func compareDates(firstDate:Date, secondDate: Date) -> String {
        if firstDate.compare(secondDate) == ComparisonResult.orderedSame{
            return "="
        }
        if firstDate.compare(secondDate) == ComparisonResult.orderedDescending{
            return ">"
        }
        if firstDate.compare(secondDate) == ComparisonResult.orderedAscending{
            return "<"
        }
        return "="
    }

    
}
