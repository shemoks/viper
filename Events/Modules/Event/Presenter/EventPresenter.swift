//
//  EventEventPresenter.swift
//  Events
//
//  Created by Shemshur Oksana on 21/10/2016.
//  Copyright © 2016 mozy. All rights reserved.
//

class EventPresenter: EventModuleInput, EventViewOutput, EventInteractorOutput {

    weak var view: EventViewInput!
    var interactor: EventInteractorInput!
    var router: EventRouterInput!

    func viewIsReady() {

    }
}
