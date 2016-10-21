//
//  MapMapConfigurator.swift
//  Events
//
//  Created by Shemshur Oksana on 20/10/2016.
//  Copyright © 2016 mozy. All rights reserved.
//

import UIKit

class MapModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? MapViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: MapViewController) {

        let router = MapRouter()

        let presenter = MapPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = MapInteractor()
        interactor.presenter = presenter

        presenter.interactor = interactor
        viewController.presenter = presenter
        router.transitionHandler = viewController
    }

}
