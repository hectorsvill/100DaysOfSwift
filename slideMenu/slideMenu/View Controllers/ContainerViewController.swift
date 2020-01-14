//
//  ContainerViewController.swift
//  slideMenu
//
//  Created by h on 1/9/20.
//  Copyright © 2020 h. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {
    
    var menuViewController: UIViewController!
    var centerNavViewController: UIViewController!
    var isExpanded = false

    override func viewDidLoad() {
        super.viewDidLoad()
        configureHomeController()
    }
    
    func configureHomeController() {
        let homeController = HomeViewController()
        centerNavViewController = UINavigationController(rootViewController: homeController)
        homeController.delegate = self
        view.addSubview(centerNavViewController.view)
        addChild(centerNavViewController)
        centerNavViewController.didMove(toParent: self)
    }
    
    func configureMenuViewController() {
        if menuViewController == nil {
            menuViewController = MenuViewController()
            view.insertSubview(menuViewController.view, at: 0)
            addChild(menuViewController)
            menuViewController.didMove(toParent: self)
            print("did add menu controller")
            
        }
    }

    func showMenuController(shouldExpand: Bool) {
        
        if shouldExpand {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.centerNavViewController.view.frame.origin.x = self.centerNavViewController.view.frame.width - 80
            })
                
        } else {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                           self.centerNavViewController.view.frame.origin.x = 0
                       })
                           
        }
        
        
    }
    
}

extension ContainerViewController: HomeControllerViewDelegate {
    func handleMenuToggle() {
        if !isExpanded {
            configureMenuViewController()
        }
        
        isExpanded.toggle()
        showMenuController(shouldExpand: isExpanded)
    }
    
    
}
