//
//  DetailViewController.swift
//  MySwiftWebsites
//
//  Created by Hector Steven on 2/26/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import UIKit
import WebKit
class DetailViewController: UIViewController, WKNavigationDelegate {

	var selectedSite: String?
	var webView: WKWebView! // create webview obj
	
	override func loadView()
	{
		webView = WKWebView()
		webView.navigationDelegate = self
		view = webView
	}
	
	override func viewDidLoad()
	{
		super.viewDidLoad()
		
		let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
		let back = UIBarButtonItem(barButtonSystemItem: .rewind, target: webView, action: #selector(webView.goBack))
		let forward = UIBarButtonItem(barButtonSystemItem: .play, target: webView, action: #selector(webView.goForward))
		
		title = selectedSite!
		navigationItem.largeTitleDisplayMode = .never
		
		
		toolbarItems = [back, spacer, forward]
		navigationController?.isToolbarHidden = false
		
		//create and get url
		let url = URL(string: "https://\(selectedSite!)")!
		webView.load(URLRequest(url: url))
		webView.allowsBackForwardNavigationGestures = true
		
	}
	
	//only alow safe links
	func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void)
	{
		let url = navigationAction.request.url
		if let host = url?.host
		{
			if host.contains(selectedSite!)
			{
				print("Decision allow")
				decisionHandler(.allow)
				
				return
			}
		}

		//alert controler

		decisionHandler(.cancel)
		if let host = url?.host
		{
			if !host.contains(selectedSite!)
			{
				let ac = UIAlertController(title: "Blocked", message: "This link does not belong to \(selectedSite!)", preferredStyle: .alert)
				ac.addAction(UIAlertAction(title: "OK", style: .default))
				present(ac, animated: true)
			}
		}
		print("Decision cancel")
	}
	
//	override func viewWillAppear(_ animated: Bool) {
//		super.viewWillAppear(animated)
//		navigationController?.hidesBarsOnTap = true
//	}
}
