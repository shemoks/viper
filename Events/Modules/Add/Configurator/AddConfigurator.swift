//
//  AddAddConfigurator.swift
//  Events
//
//  Created by Shemshur Oksana on 11/10/2016.
//  Copyright © 2016 mozy. All rights reserved.
//

import UIKit

class AddModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? AddViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: AddViewController) {

        let router = AddRouter()

        let presenter = AddPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = AddInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
