//
//  MapView.swift
//  Events
//
//  Created by Mac on 10/19/16.
//  Copyright © 2016 Mac. All rights reserved.
//

import UIKit
import GoogleMaps

class MapView: UIView {
   
    var view: UIView!
    var lat: Double = 0.0
    var long: Double = 0.0
    var nibName: String = "Map"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
   
    override func awakeFromNib() {
        let camera = GMSCameraPosition.camera(withLatitude: lat, longitude: long, zoom: 12)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.isMyLocationEnabled = true
        view = mapView
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: lat, longitude: long)
        marker.map = mapView
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        setup()
    }
    
    func setup() {
       view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        let camera = GMSCameraPosition.camera(withLatitude: lat, longitude: long, zoom: 12)
//        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
//        mapView.isMyLocationEnabled = true
//        view = mapView
//        
//        // Creates a marker in the center of the map.
//        let marker = GMSMarker()
//        marker.position = CLLocationCoordinate2D(latitude: lat, longitude: long)
//        marker.map = mapView
        addSubview(view)
        
        
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
}
