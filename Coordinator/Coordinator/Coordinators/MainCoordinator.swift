//
//  MainCoordinator.swift
//  Coordinator
//
//  Created by Hector on 10/26/19.
//  Copyright © 2019 Hector. All rights reserved.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var childCoordinator = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = ViewController.instantiate()
        navigationController.pushViewController(vc, animated: true)
        
    }
    

}


