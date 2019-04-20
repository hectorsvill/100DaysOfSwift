//
//  NotesViewController.swift
//  hNotes
//
//  Created by Hector Steven on 4/16/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
	
	let util = Util()
	fileprivate let cellid = "NotesCellId"
	var notes = ["note one", "another note"]
	
	

	var FolderName = ""
	
	@IBOutlet var notesTableView: UITableView!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(view.edit))
		navigationItem.rightBarButtonItem?.tintColor = .green
		
		title = FolderName
	
		notesTableView.dataSource = self
		notesTableView.delegate = self
    }
	
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return notes.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = notesTableView.dequeueReusableCell(withIdentifier: cellid, for: indexPath)
		cell.textLabel?.text = "\(notes[indexPath.row])"
		cell.detailTextLabel?.text = util.getCurrentTime()
		return cell
	}
	

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
	}
	
	
	func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
		let delete = UITableViewRowAction(style: .destructive, title: "Delete") {
			(action, indexPath) in
			
			self.notes.remove(at: indexPath.row)
			self.notesTableView.reloadData()
		}
		return [delete]
	}
	
	@IBAction func addNoteButton(_ sender: Any) {
		print("push to text view!")
//		navigationController?.pushViewController(<#T##viewController: UIViewController##UIViewController#>, animated: true)
		
	}
	
}


