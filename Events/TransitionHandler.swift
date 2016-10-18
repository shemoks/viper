//
//  TransitionHendler.swift
//  Events
//
//  Created by Mac on 10/18/16.
//  Copyright © 2016 Mac. All rights reserved.
//

import Foundation
import UIKit

protocol TransitionHandler: class {
   
    func push(viewController: UIViewController)
    func dismiss()
    
}

extension TransitionHandler where Self: UIViewController {

    func push(viewController: UIViewController) {
    
        if let nav = navigationController {
            nav.pushViewController(viewController, animated: true)
        } else {
            present(viewController, animated: true, completion: nil)
        }
}
    func dismiss(){
        if let nav = navigationController {
            nav.popViewController(animated: true)
        } else if let _ = presentingViewController {
            dismiss(animated: true, completion: nil)
        }
    }
}

