//
//  ListListRouter.swift
//  EventPlanner
//
//  Created by Shemshur Oksana on 10/10/2016.
//  Copyright © 2016 Test. All rights reserved.
//
import UIKit

final class ListRouter: ListRouterInput {
  
  var transitionHandler: TransitionHandler!
    
  
    func openAddEventModule() {
       
        let addViewController = UIStoryboard.init(name: "Add", bundle: nil).instantiateViewController(withIdentifier: "AddController") as? AddViewController
        transitionHandler.push(viewController: addViewController!)
        
//        viewController.navigationController?.pushViewController(addViewController!, animated: true)
    }
    
    func showDescription(event: Event){
        let eventViewController = UIStoryboard.init(name: "List", bundle: nil).instantiateViewController(withIdentifier: "showDescription") as? EventViewController
        let information = Events(information: event.descriptions, lat: event.lat, long: event.long, place: event.place)
        eventViewController?.information = information
        transitionHandler.push(viewController: eventViewController!)
    }
    
   
    
}


