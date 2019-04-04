//
//  CountryViewController.swift
//  Project16
//
//  Created by Hector Steven on 4/4/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import UIKit
import WebKit




class CountryViewController: UIViewController, WKUIDelegate {

	let countryDict = [
		"Washington DC" : "https://en.wikipedia.org/wiki/United_States_Capitol",
		"Rome" : "https://en.wikipedia.org/wiki/Rome",
		"Paris" : "https://en.wikipedia.org/wiki/Paris",
		"Oslo" : "https://en.wikipedia.org/wiki/Oslo",
		"London" : "https://en.wikipedia.org/wiki/London"
	]
	
	var webView: WKWebView!
	var name: String?
	
	override func loadView() {
		let webConfig = WKWebViewConfiguration()
		webView = WKWebView(frame: .zero, configuration: webConfig)
		webView.uiDelegate = self
		view = webView
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		view.backgroundColor = .white
	
		if !setupWebView() {
			let ac = UIAlertController(title: "Error Loading", message: nil, preferredStyle: .alert)
			ac.addAction(UIAlertAction(title: "Ok", style: .default))
			present(ac, animated: true)
		}
    }

	func setupWebView() -> Bool{
		if let capital = name {
			if let str = countryDict[capital] {
				let myURL = URL(string: str)
				let myRequest = URLRequest(url: myURL!)
				webView.load(myRequest)
				return true
			}
		}
		return false
	}
}

