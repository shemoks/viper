//
//  AddAddModuleInput.swift
//  Events
//
//  Created by Shemshur Oksana on 11/10/2016.
//  Copyright © 2016 mozy. All rights reserved.
//
import Foundation

protocol AddModuleInput: class {
    
    func setData(event: String, dates: Date)
    func tapForPicker(currentDay: Date) -> String

}
