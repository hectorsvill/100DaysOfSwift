//
//  ViewController.swift
//  hNotes
//
//  Created by Hector Steven on 4/16/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet var newFolderButton: UIButton!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		navigationController?.navigationBar.prefersLargeTitles = true
		title = "Folders"
		
		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(edit))
		navigationItem.rightBarButtonItem?.tintColor = .green
	}

	
}


extension ViewController {
	@objc func edit () {
		print("print tableview")
	}
}
