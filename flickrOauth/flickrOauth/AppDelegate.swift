//
//  AppDelegate.swift
//  flickrOauth
//
//  Created by s on 2/10/20.
//  Copyright © 2020 s. All rights reserved.
//

import UIKit
import OAuthSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}
//
//// MARK: handle callback url
//extension AppDelegate {
//
//    func applicationHandle(url: URL) {
//        if (url.host == "oauth-callback") {
//            OAuthSwift.handle(url: url)
//        } else {
//            // Google provider is the only one with your.bundle.id url schema.
//            OAuthSwift.handle(url: url)
//        }
//    }
//}
//
//// MARK: ApplicationDelegate
//extension AppDelegate {
//
//    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
//        applicationHandle(url: url)
//        return true
//    }
//
//    @available(iOS 9.0, *)
//    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
//        applicationHandle(url: url)
//        return true
//    }
//
//    class var sharedInstance: AppDelegate {
//        return UIApplication.shared.delegate as! AppDelegate
//    }
//
//}
