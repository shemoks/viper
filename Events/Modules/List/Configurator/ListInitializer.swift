//
//  ListListInitializer.swift
//  EventPlanner
//
//  Created by Shemshur Oksana on 10/10/2016.
//  Copyright © 2016 Test. All rights reserved.
//

import UIKit

class ListModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var listViewController: ListViewController!

    override func awakeFromNib() {

        let configurator = ListModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: listViewController)
    }

}
