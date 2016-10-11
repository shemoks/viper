//
//  TableViewCell.swift
//  EventPlanner
//
//  Created by Mac on 10/11/16.
//  Copyright © 2016 Mac. All rights reserved.
//

import UIKit

final class TableViewCell: UITableViewCell{
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var eventLabel: UILabel!
    
    func configure(with event: Event) {
        dayLabel.text = DateHelper.getStringDateDay(date: event.dueDate)
        eventLabel.text = event.name
    }
}

