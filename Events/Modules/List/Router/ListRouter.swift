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
    
}


