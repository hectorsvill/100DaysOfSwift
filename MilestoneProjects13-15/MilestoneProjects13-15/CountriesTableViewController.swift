//
//  CountriesTableViewController.swift
//  MilestoneProjects13-15
//
//  Created by Hector Steven on 3/31/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import UIKit

class CountriesTableViewController: UITableViewController {

	let flagCellId = "flagCellId"
	
    override func viewDidLoad() {
        super.viewDidLoad()
		title = "Origin Facts"
		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(giveInfo))
		tableView.register(FlagCell.self, forCellReuseIdentifier: flagCellId)
    }
	
	
	@objc func  giveInfo() {
		let ac = UIAlertController(title: "Origin Facts", message: "Get facts about your favorite Countrie", preferredStyle: .actionSheet)
		ac.addAction(UIAlertAction(title: "OK", style: .cancel))
		present(ac, animated: true)
	}
	

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 10
    }

	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: flagCellId, for: indexPath)
//		cell.textLabel?.text = "\(indexPath.row)"
//		let image = UIImage(named: "US")
//		cell.imageView?.image = image
//		
		return cell
	}
	
	
   

}
