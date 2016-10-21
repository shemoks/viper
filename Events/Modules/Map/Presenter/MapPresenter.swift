//
//  MapMapPresenter.swift
//  Events
//
//  Created by Shemshur Oksana on 20/10/2016.
//  Copyright © 2016 mozy. All rights reserved.
//
struct Coordinates {
    var lat: Double
    var long: Double
}

class MapPresenter: MapModuleInput, MapViewOutput, MapInteractorOutput {

    var coord: MapRouterOutput? = nil

    
    weak var view: MapViewInput!
    var interactor: MapInteractorInput!
    var router: MapRouterInput!
    var currentCoordinates = Coordinates(lat: 0.0, long: 0.0)
    
    func setCoordinates(lat: Double, long: Double) {
        self.currentCoordinates.lat = lat
        self.currentCoordinates.long = long
    }
    
    func getData() {
//        if (coord != nil) {
//            coord?.coord = self.currentCoordinates
//            coord?.getCoord(data: (coord?.coord)!)
//        }
        router.openAddController(coord: self.currentCoordinates)
    }
}
