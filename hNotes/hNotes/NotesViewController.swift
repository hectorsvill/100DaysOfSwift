//
//  NotesViewController.swift
//  hNotes
//
//  Created by Hector Steven on 4/16/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import UIKit

class NotesViewController:  UIViewController, UITableViewDataSource, UITableViewDelegate {
	@IBOutlet var notesTableView: UITableView!
	
	
	let util = Util()
	fileprivate let cellid = "NotesCellId"
	var folderNote = FolderNote()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: nil)//#selector(view.edit))
		navigationItem.rightBarButtonItem?.tintColor = .green

		title = folderNote.folderName
		notesTableView.dataSource = self
		notesTableView.delegate = self
    }
	
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = notesTableView.dequeueReusableCell(withIdentifier: cellid, for: indexPath)
		cell.textLabel?.text = folderNote.folderName
		cell.detailTextLabel?.text = util.getCurrentTime()
		return cell
	}
	

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
	}
	
	
	func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
		let delete = UITableViewRowAction(style: .destructive, title: "Delete") {
			(action, indexPath) in
			
//			self.notes.remove(at: indexPath.row)
			self.notesTableView.reloadData()
		}
		return [delete]
	}
	
	@IBAction func addNoteButton(_ sender: Any) {
		print("push to text view!")
//		navigationController?.pushViewController(<#T##viewController: UIViewController##UIViewController#>, animated: true)
		
	}
	
}


