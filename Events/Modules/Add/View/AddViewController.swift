//
//  AddAddViewController.swift
//  Events
//
//  Created by Shemshur Oksana on 11/10/2016.
//  Copyright © 2016 mozy. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import GoogleMaps

class AddViewController: UIViewController, AddViewInput, TransitionHandler, MapRouterOutput {
    
    @IBOutlet weak var picker: UIDatePicker!
    @IBOutlet weak var dateLabel: UITextField!
    @IBOutlet weak var eventLabel: UITextField!
    @IBOutlet weak var descriptionView: UITextView!
    @IBOutlet weak var buttonSave: UIBarButtonItem!
    var currentCoord = Coordinates(lat: 0.0, long: 0.0)
    @IBOutlet weak var long: UITextField!
    @IBOutlet weak var lantitude: UITextField!
    
    @IBOutlet weak var mapOpenButton: UIButton!
    var presenter: AddModuleInput!
    var disposeBag = DisposeBag()
    
    func getCoord(data: Coordinates) {
        self.currentCoord = data
        lantitude.text = String(currentCoord.lat)
        long.text = String(currentCoord.long)
    }
    
    lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker.rx.date.asDriver()
            .map {
                self.dateFormatter.string(from: $0)
            }
            .drive(onNext: {
                self.dateLabel.text = "\($0)"
            }).addDisposableTo(disposeBag)
        
        buttonSave.rx.tap.asDriver().drive(onNext: {
            self.presenter.setData(event: self.eventLabel.text!, dates: self.dateFormatter.date(from: self.dateLabel.text!)!, description: self.descriptionView.text, lat: Double(self.lantitude.text!)!, long: Double(self.long.text!)! )
        }).addDisposableTo(disposeBag)
        
        mapOpenButton.rx.tap.asDriver().drive(onNext: {
            self.presenter.handleMapEventTap()
        }).addDisposableTo(disposeBag)
       
        lantitude.text = String(currentCoord.lat)
        long.text = String(currentCoord.long)
        
    }
    
    func showAlert () {
        let alertController = UIAlertController(title: "iOScreator", message:
            "enter the name of the event!", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Map" {
            let controller: MapViewController = segue.destination as! MapViewController
            controller.coord = self
        }
    }
    
}
