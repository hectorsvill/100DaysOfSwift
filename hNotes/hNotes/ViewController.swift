//
//  ViewController.swift
//  hNotes
//
//  Created by Hector Steven on 4/16/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Folders"
		navigationController?.navigationBar.prefersLargeTitles = true
		
		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(edit))
	}

	
}


extension ViewController {
	@objc func edit () {
		print("print tableview")
	}
}
