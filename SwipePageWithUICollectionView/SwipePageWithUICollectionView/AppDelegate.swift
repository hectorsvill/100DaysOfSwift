//
//  AppDelegate.swift
//  SwipePageWithUICollectionView
//
//  Created by Hector on 12/8/19.
//  Copyright © 2019 Hector. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
        window = UIWindow()
        window?.makeKeyAndVisible()
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal

        let swipingController = SwipingController(collectionViewLayout: layout)
        
        window?.rootViewController = swipingController
        
        return true
    }


}

