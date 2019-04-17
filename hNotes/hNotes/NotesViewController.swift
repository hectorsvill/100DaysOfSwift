//
//  NotesViewController.swift
//  hNotes
//
//  Created by Hector Steven on 4/16/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController {

	var FolderName = ""
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(view.edit))
		navigationItem.rightBarButtonItem?.tintColor = .green
		
		
		title = FolderName
		
    }

	
}


