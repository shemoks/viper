//
//  AddAddPresenter.swift
//  Events
//
//  Created by Shemshur Oksana on 11/10/2016.
//  Copyright © 2016 mozy. All rights reserved.
//

class AddPresenter: AddModuleInput, AddViewOutput, AddInteractorOutput {

    weak var view: AddViewInput!
    var interactor: AddInteractorInput!
    var router: AddRouterInput!

    func viewIsReady() {

    }
}
