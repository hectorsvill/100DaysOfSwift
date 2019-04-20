//
//  ViewController.swift
//  hNotes
//
//  Created by Hector Steven on 4/16/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import UIKit



class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
	
	var Folders = [FolderNote]()
	@IBOutlet var FolderTableView: UITableView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		navigationController?.navigationBar.prefersLargeTitles = true
		title = "Folders"
		
		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(view.edit))
		navigationItem.rightBarButtonItem?.tintColor = .green

		FolderTableView.dataSource = self
		FolderTableView.delegate = self
		
		Folders += Util().Tests1()
	}
	
	@IBAction func NewFolderButton(_ sender: Any) {
		createNewFolder()
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return Folders.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = FolderTableView.dequeueReusableCell(withIdentifier: "FolderCellId", for: indexPath)
		cell.accessoryType = .disclosureIndicator
		cell.textLabel?.text = Folders[indexPath.row].folderName
		cell.detailTextLabel?.text = String(Folders[indexPath.row].numberOfNotesInFolder)
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		if let vc = storyboard?.instantiateViewController(withIdentifier: "NotesViewController") as? NotesViewController {
//			vc.Folders[0]. = FolderList[indexPath.row]
			navigationController?.pushViewController(vc, animated: true)
		}
	}
	
	func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
		let delete = UITableViewRowAction(style: .destructive, title: "Delete") {
			(action, indexPath) in
			self.Folders.remove(at: indexPath.row)
			self.FolderTableView.reloadData()
		}
		return [delete]
	}
}

extension ViewController {
	func createNewFolder() {
		
		
		let ac = UIAlertController(title: "New Folder", message: "Enter a name for this folder.", preferredStyle: .alert)
		ac.addTextField()
		ac.addAction(UIAlertAction(title: "Save", style: .default, handler: {
			[weak self ] _ in
			guard let str = ac.textFields?[0].text else {
				print("error: createNewFolder()")
				return
			}
			self?.Folders.append(FolderNote(folderName: str))
			self?.FolderTableView.reloadData()
		}))
		ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
		present(ac, animated: true)
	}
}

extension UIView {
	@objc func edit() {
		
	}
}
