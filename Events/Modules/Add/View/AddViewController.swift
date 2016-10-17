//
//  AddAddViewController.swift
//  Events
//
//  Created by Shemshur Oksana on 11/10/2016.
//  Copyright © 2016 mozy. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, AddViewInput {
    @IBOutlet weak var picker: UIDatePicker!
    @IBOutlet weak var dateLabel: UITextField!
    @IBOutlet weak var eventLabel: UITextField!
    @IBAction func saveClick(_ sender: AnyObject) {
        getData()
    }
    var presenter: AddModuleInput!
    
    @IBAction func pickerClick(_ sender: AnyObject) {
        dateLabel.text = presenter.tapForPicker(currentDay: picker.date)
    }
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //output.viewIsReady()
    }
    
    // MARK: AddViewInput
    func getData() {
        let date = DateHelper.getStringFromDate(date: picker.date)
        let dateForBase = DateHelper.getDateFromString(date: date)
        presenter.setData(event: eventLabel.text!, dates: dateForBase)
    }
    
}
