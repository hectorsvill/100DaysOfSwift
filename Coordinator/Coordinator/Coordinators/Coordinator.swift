//
//  Coordinator.swift
//  Coordinator
//
//  Created by Hector on 10/26/19.
//  Copyright © 2019 Hector. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinator: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
