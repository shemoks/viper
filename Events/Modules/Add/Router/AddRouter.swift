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
    
    func openMap(){
//        let addViewController = UIStoryboard.init(name: "Add", bundle: nil).instantiateViewController(withIdentifier: "Map") as? MapViewController
//        //transitionHandler.push(viewController: addViewController!)
    }
}
