//
//  ViewController.swift
//  hNotes
//
//  Created by Hector Steven on 4/16/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
	
	

	@IBOutlet var newFolderButton: UIButton!
	@IBOutlet var FoldersTableView: FolderTableView!
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		navigationController?.navigationBar.prefersLargeTitles = true
		title = "Folders"
		
		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(edit))
		navigationItem.rightBarButtonItem?.tintColor = .green

		FoldersTableView.dataSource = self
		FoldersTableView.delegate = self
	}
	
	
	@IBAction func NewFolderButton(_ sender: Any) {
		CreateNewFolder()
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 20
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = FoldersTableView.dequeueReusableCell(withIdentifier: "FolderCellId", for: indexPath)
		
		cell.textLabel?.text = "\(indexPath.row)"
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		print("\(indexPath.row)")
	}
	
	
}

extension ViewController {
	
	func CreateNewFolder() {
		let ac = UIAlertController(title: "New Folder", message: "Enter a name for this folder.", preferredStyle: .alert)
		ac.addTextField()
		ac.addAction(UIAlertAction(title: "Save", style: .default, handler: {
			[weak self ] _ in
			print("save")
		}))
		
		
		ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
		
		
		present(ac, animated: true)
	}
	
	@objc func edit () {
		
	}
}
