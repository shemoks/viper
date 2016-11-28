//
//  EventEventViewController.swift
//  Events
//
//  Created by Shemshur Oksana on 21/10/2016.
//  Copyright © 2016 mozy. All rights reserved.
//

import UIKit
import GoogleMaps

struct Events {
    var information: String = ""
    var lat: Double = 0.0
    var long: Double = 0.0
    var place: String = ""
}

class EventViewController: UIViewController, EventViewInput, GMSMapViewDelegate{

    var output: EventViewOutput!
    var information: Events!
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: EventViewInput
    func setupInitialState() {
    }
    
    override func loadView() {
        var arrayOfString = [String]()
        let camera = GMSCameraPosition.camera(withLatitude: information.lat,
                                              longitude:information.long,
                                              zoom:12)
        let mapView = GMSMapView.map(withFrame: .zero, camera: camera)
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: information.lat, longitude: information.long)
       arrayOfString.append(information.place)
       arrayOfString.append(information.information)
        marker.snippet = arrayOfString.joined(separator: "\n")
        marker.map = mapView
        marker.tracksInfoWindowChanges = true
        mapView.delegate = self
        self.view = mapView
    }
    
    // MARK: GMSMapViewDelegate
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
       
               //  print("You tapped at \(coordinate.latitude), \(coordinate.longitude)")
    }

}
