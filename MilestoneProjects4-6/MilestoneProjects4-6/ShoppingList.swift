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
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: "listItem", for: indexPath)
		
		cell.textLabel?.text = shoppingList[indexPath.row]
		return cell
	}
	
	
	@objc func addToShoppingList() {
		let ac = UIAlertController(title: "Enter Item:", message: nil, preferredStyle: .alert)
		
		//add textfield
		ac.addTextField()
		
		//grab text
		let submitItem = UIAlertAction(title: "Submit", style: .default) {
			[weak self, weak ac] action in
			guard let item = ac?.textFields?[0].text  else { return }
			self?.addToTable(item)
		}

		ac.addAction(submitItem)
		present(ac, animated: true)
	}
	
	func addToTable(_ item: String)
	{
	
		shoppingList.insert(item, at: 0)
		//shoppingList.append(item)
		
		let ip = IndexPath(row: 0, section: 0)
		
		tableView.insertRows(at: [ip], with: .automatic)
		
		print(shoppingList)
	}
	


}
