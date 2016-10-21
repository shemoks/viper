//
//  MapMapRouter.swift
//  Events
//
//  Created by Shemshur Oksana on 20/10/2016.
//  Copyright © 2016 mozy. All rights reserved.
//

class MapRouter: MapRouterInput {
    
    var transitionHandler: TransitionHandler!
    
    func openAddController(coord: Coordinates){
    transitionHandler.dismissWithData(data: coord)
  }
}
