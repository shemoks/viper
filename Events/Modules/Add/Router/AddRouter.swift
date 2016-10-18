//
//  AddAddRouter.swift
//  Events
//
//  Created by Shemshur Oksana on 11/10/2016.
//  Copyright © 2016 mozy. All rights reserved.
//
import UIKit

class AddRouter: AddRouterInput {
    var transitionHandler: TransitionHandler!
    
    func closeModule(){
        
        transitionHandler.dismiss()
    }
}
