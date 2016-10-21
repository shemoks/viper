//
//  EventEventInitializer.swift
//  Events
//
//  Created by Shemshur Oksana on 21/10/2016.
//  Copyright © 2016 mozy. All rights reserved.
//

import UIKit

class EventModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var eventViewController: EventViewController!

    override func awakeFromNib() {

        let configurator = EventModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: eventViewController)
    }

}
