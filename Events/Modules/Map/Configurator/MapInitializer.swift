//
//  MapMapInitializer.swift
//  Events
//
//  Created by Shemshur Oksana on 20/10/2016.
//  Copyright © 2016 mozy. All rights reserved.
//

import UIKit

class MapModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var mapViewController: MapViewController!

    override func awakeFromNib() {

        let configurator = MapModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: mapViewController)
    }

}
