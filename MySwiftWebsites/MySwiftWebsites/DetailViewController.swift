//
//  DetailViewController.swift
//  MySwiftWebsites
//
//  Created by Hector Steven on 2/26/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

	var selectedSite: String?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		
		title = selectedSite!
	}
}
