//
//  ListListConfigurator.swift
//  EventPlanner
//
//  Created by Shemshur Oksana on 10/10/2016.
//  Copyright © 2016 Test. All rights reserved.
//

import UIKit

class ListModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? ListViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: ListViewController) {

        let router = ListRouter()

        let presenter = ListPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = ListInteractor()
        interactor.presenter = presenter

        presenter.interactor = interactor
        viewController.presenter = presenter
    }

}
