//
//  FoldersTableViewController.swift
//  hNotes
//
//  Created by Hector Steven on 4/16/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import UIKit

class FoldersTableViewController: UITableViewController {
	fileprivate let cellid = "folderCellId"
	
    override func viewDidLoad() {
        super.viewDidLoad()
		title = "Folders"
		navigationController?.navigationBar.prefersLargeTitles = true
		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(edit)) 
		
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 40
    }
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: cellid, for: indexPath)
		cell.textLabel?.text = "\(indexPath.row)"
		
		return cell
	}
	

}

extension FoldersTableViewController {
	@objc func edit() {
		print("edit rows!")
	}
}
