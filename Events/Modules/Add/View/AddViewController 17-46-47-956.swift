//
//  AddAddViewController.swift
//  Events
//
//  Created by Shemshur Oksana on 11/10/2016.
//  Copyright © 2016 mozy. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, AddViewInput {

    var output: AddViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: AddViewInput
    func setupInitialState() {
    }
}
