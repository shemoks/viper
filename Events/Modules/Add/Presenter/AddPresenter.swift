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

    func setData(event: String, dates: Date) {
       interactor.addToDataBase(name: event, date: dates)
    }
    
    func alert(){
        
    }
    
    func tapForPicker(currentDay: Date) -> String {
       return DateHelper.getStringFromDate(date: currentDay)
    }
}
