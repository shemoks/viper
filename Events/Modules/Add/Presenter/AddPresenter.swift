//
//  AddAddPresenter.swift
//  Events
//
//  Created by Shemshur Oksana on 11/10/2016.
//  Copyright © 2016 mozy. All rights reserved.
//
import Foundation

class AddPresenter: AddModuleInput, AddViewOutput, AddInteractorOutput {

    weak var view: AddViewInput!
    var interactor: AddInteractorInput!
    var router: AddRouterInput!

    func setData(event: String, dates: Date, description: String, lat: Double, long: Double) {
        let result = interactor.addToDataBase(name: event, date: dates, description: description, lat: lat, long: long)
        if !result {
           view.showAlert()
        } else {
           router.closeModule()
        }
    }
    
    func tapForPicker(currentDay: Date) -> String {
       return DateHelper.getStringFromDate(date: currentDay)
    }
    
    func handleMapEventTap(){
        router.openMap()
    }
}
