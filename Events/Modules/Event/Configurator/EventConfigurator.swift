//
//  EventEventConfigurator.swift
//  Events
//
//  Created by Shemshur Oksana on 21/10/2016.
//  Copyright © 2016 mozy. All rights reserved.
//

import UIKit

class EventModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? EventViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: EventViewController) {

        let router = EventRouter()

        let presenter = EventPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = EventInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
