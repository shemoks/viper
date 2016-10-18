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

class AddViewController: UIViewController, AddViewInput, TransitionHandler {
    
    
    @IBOutlet var tapGestureRecognizer: UITapGestureRecognizer!
    @IBOutlet weak var picker: UIDatePicker!
    @IBOutlet weak var dateLabel: UITextField!
    @IBOutlet weak var eventLabel: UITextField!
    
    @IBOutlet weak var descriptionView: UITextView!
    @IBOutlet weak var buttonSave: UIBarButtonItem!
//    @IBAction func saveClick(_ sender: AnyObject) {
//        getData()
//    }
    var presenter: AddModuleInput!
    var disposeBag = DisposeBag()
    
    lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tapGestureRecognizer.rx.event.asDriver().drive(onNext: { [unowned self] _ in self.view.endEditing(true)
            }).addDisposableTo(disposeBag)
        
        picker.rx.date.asDriver()
            .map {
                self.dateFormatter.string(from: $0)
            }
            .drive(onNext: {
                self.dateLabel.text = "\($0)"
            }).addDisposableTo(disposeBag)
        
        buttonSave.rx.tap.asDriver().drive(onNext: {
            self.presenter.setData(event: self.eventLabel.text!, dates: self.dateFormatter.date(from: self.dateLabel.text!)!, description: self.descriptionView.text)
        }).addDisposableTo(disposeBag)
    }
    
    func showAlert () {
        let alertController = UIAlertController(title: "iOScreator", message:
            "enter the name of the event!", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }

}
