//
//  MapMapViewController.swift
//  Events
//
//  Created by Shemshur Oksana on 20/10/2016.
//  Copyright © 2016 mozy. All rights reserved.
//

import UIKit
import GoogleMaps
import RxSwift
import RxCocoa


class MapViewController: UIViewController, MapViewInput, GMSMapViewDelegate,TransitionHandler {
    @IBOutlet weak var buttonSave: UIBarButtonItem!
    var coord: MapRouterOutput!
    var presenter: MapViewOutput!
    var disposeBag = DisposeBag()
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //   output.viewIsReady()
        buttonSave.rx.tap.asDriver().drive(onNext: {
            self.presenter.getData()
        }).addDisposableTo(disposeBag)
    }
    
    
    // MARK: MapViewInput
    func setupInitialState() {
    }
    
    override func loadView() {
        let camera = GMSCameraPosition.camera(withLatitude: 49.4444,
                                              longitude:32.0598,
                                              zoom:12)
        let mapView = GMSMapView.map(withFrame: .zero, camera: camera)
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 49.4444, longitude: 32.0598)
        marker.title = "Cherkassy"
        marker.snippet = "Ukraine"
        marker.map = mapView
        mapView.delegate = self
        self.view = mapView
    }
    
    // MARK: GMSMapViewDelegate
    
//    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
//        var result = Coordinates(lat: 0.0, long: 0.0, adress: "")
//        mapView.clear()
//        let marker = GMSMarker()
//        marker.position = CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)
//        marker.map = mapView
//        presenter.setCoordinates(lat: coordinate.latitude, long: coordinate.longitude, adress: "")
//        result.lat = coordinate.latitude
//        result.long = coordinate.longitude
//        let geocoder = GMSGeocoder()
//        geocoder.reverseGeocodeCoordinate(coordinate) { response, error in
//            if let address = response?.firstResult() {
//                let lines = address.lines! as [String]
//                result.adress = lines.first!
//            }
//        }
//              //  self.addressLabel.text = lines.joinWithSeparator("\n")
//        coord.getCoord(data: result)
//    }
    
    func mapView(_ mapView: GMSMapView, didTapPOIWithPlaceID placeID: String, name: String, location: CLLocationCoordinate2D) {
        var result = Coordinates(lat: 0.0, long: 0.0, adress: "")
        mapView.clear()
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
        marker.map = mapView
        presenter.setCoordinates(lat: location.latitude, long: location.longitude, adress: name)
        result.lat = location.latitude
        result.long = location.longitude
        result.adress = name
        coord.getCoord(data: result)
    }
}
