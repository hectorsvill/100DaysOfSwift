//
//  ShoppingList.swift
//  MilestoneProjects4-6
//
//  Created by Hector Steven on 3/4/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

//Create an app that lets people create a shopping list by adding items to a table view.

import UIKit

class ShoppingList: UITableViewController {

	var shoppingList: [String] = []
	
	override func viewDidLoad()
	{
		super.viewDidLoad()
		title = "Shopping List"
		
		
		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addToShoppingList))
		
	}


	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return shoppingList.count
	}
	
	
	@objc func addToShoppingList() {
		shoppingList.append(" ")
		
		let ac = UIAlertController(title: "title", message: "Please add an Item", preferredStyle: .alert)
		ac.addAction(UIAlertAction(title: "ok", style: .cancel))
		present(ac, animated: true)
	}

}
