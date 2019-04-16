//
//  ViewController.swift
//  hNotes
//
//  Created by Hector Steven on 4/16/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet var FoldersTableView: UITableView!
	let cellId = "FolderCells"
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		navigationItem.title = "hNotes"
		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: nil)
		
//		view.addSubview(FoldersTableView)
	}


}

