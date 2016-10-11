//
//  AddAddInitializer.swift
//  Events
//
//  Created by Shemshur Oksana on 11/10/2016.
//  Copyright © 2016 mozy. All rights reserved.
//

import UIKit

class AddModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var addViewController: AddViewController!

    override func awakeFromNib() {

        let configurator = AddModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: addViewController)
    }

}
