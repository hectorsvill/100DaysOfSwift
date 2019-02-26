//
//  ViewController.swift
//  Project4
//
//  Created by Hector Steven on 2/25/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

	var webView: WKWebView!
	
	override func loadView()
	{
		webView = WKWebView()
		webView.navigationDelegate = self
		view = webView

		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(openTapped))
	}
	
	override func viewDidLoad()
	{
		super.viewDidLoad()

		let url = URL(string: "https://www.hackingwithswift.com/")!
		webView.load(URLRequest(url: url))
		webView.allowsBackForwardNavigationGestures = true
	}

	@objc func openTapped ()
	{
		let ac = UIAlertController(title: "Select A Page", message: nil, preferredStyle: .actionSheet)
		
		ac.addAction(UIAlertAction(title: "apple.com", style: .default, handler: openPage))
		ac.addAction(UIAlertAction(title: "hackingwithswift.com/100", style: .default, handler: openPage))
		ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
		
		ac.popoverPresentationController?.barButtonItem =  self.navigationItem.backBarButtonItem
		
		present(ac, animated: true)
	}
	
	func openPage(action: UIAlertAction)
	{
		let url = URL(string: "https://www." + action.title!)!
		webView.load(URLRequest(url: url))
	}
	
}

