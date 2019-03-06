//
//  DetailViewController.swift
//  Project7
//
//  Created by Hector Steven on 3/6/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import UIKit
import WebKit



class DetailViewController: UIViewController {
	var webView: WKWebView!
	var detailItem: Petition?


	override func loadView() {
		webView = WKWebView()
		view = webView
	}
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
	
		guard let detailItem = detailItem else { return }
		print(detailItem.body.isEmpty)
		let html = """
		<html>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<style> body { font-size: 150%; color: green; text-align: justify; } </style>
		<body>
		\(detailItem.body)
		</body>
		</html?>
		"""
		webView.loadHTMLString(html, baseURL: nil)
	}
}
