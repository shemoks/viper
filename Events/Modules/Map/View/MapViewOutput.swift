//
//  MapMapViewOutput.swift
//  Events
//
//  Created by Shemshur Oksana on 20/10/2016.
//  Copyright © 2016 mozy. All rights reserved.
//

protocol MapViewOutput {

    /**
        @author Shemshur Oksana
        Notify presenter that view is ready
    */

   // func viewIsReady()
    func setCoordinates(lat: Double, long: Double)
    func getData()
}
