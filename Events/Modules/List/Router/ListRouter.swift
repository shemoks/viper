//
//  ListListRouter.swift
//  EventPlanner
//
//  Created by Shemshur Oksana on 10/10/2016.
//  Copyright © 2016 Test. All rights reserved.
//
import UIKit

class ListRouter: ListRouterInput {
    
    func openAddEventModule(viewController: ListViewController) {
       let addViewController = UIStoryboard.init(name: "Add", bundle: nil).instantiateViewController(withIdentifier: "AddController") as? AddViewController
        viewController.navigationController?.pushViewController(addViewController!, animated: true)
    }
    
}
