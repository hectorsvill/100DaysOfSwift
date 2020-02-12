//
//  ViewController.swift
//  flickrOauth
//
//  Created by s on 2/10/20.
//  Copyright © 2020 s. All rights reserved.
//

import UIKit
import OAuthSwift
import SafariServices

class ViewController: UIViewController, OAuthWebViewControllerDelegate {
    func oauthWebViewControllerDidPresent() {

    }

    func oauthWebViewControllerDidDismiss() {

    }

    func oauthWebViewControllerWillAppear() {

    }

    func oauthWebViewControllerDidAppear() {

    }

    func oauthWebViewControllerWillDisappear() {

    }

    func oauthWebViewControllerDidDisappear() {
        oauthSwift?.cancel()
    }


    var oauthSwift: OAuthSwift?



    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "log in", style: .done, target: self, action: #selector(doOAuthFlickr))

    }

    @objc func doOAuthFlickr(){
           let oauthswift = OAuth1Swift(
               consumerKey: "44f367e28c0954b2a073d37c1ada9dbe",
               consumerSecret: "f07ff5f4115ae5d2",
               requestTokenUrl: "https://www.flickr.com/services/oauth/request_token",
               authorizeUrl:    "https://www.flickr.com/services/oauth/authorize",
               accessTokenUrl:  "https://www.flickr.com/services/oauth/access_token"
           )
           self.oauthSwift = oauthswift
        oauthswift.authorizeURLHandler = SafariURLHandler(viewController: self, oauthSwift: self.oauthSwift!)
           let _ = oauthswift.authorize(withCallbackURL: URL(string: "oauth-swift://oauth-callback/flickr")!) { result in
               switch result {
               case .success(let (credential, _, _)):
                print("success👀", credential.oauthToken, credential.oauthTokenSecret)
               case .failure(let error):
                   print(error.description)
               }
           }
       }

}

