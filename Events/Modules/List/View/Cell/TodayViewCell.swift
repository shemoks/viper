//
//  TodayViewCell.swift
//  EventPlanner
//
//  Created by Mac on 10/11/16.
//  Copyright © 2016 Mac. All rights reserved.
//

import UIKit

class TodayViewCell: UITableViewCell {
    
    @IBOutlet weak var eventLabel: UILabel!
    
    func configure(with event: Event) {
        eventLabel.text = event.name
    }
}
