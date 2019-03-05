//
//  ShoppingList.swift
//  MilestoneProjects4-6
//
//  Created by Hector Steven on 3/4/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

//Create an app that lets people create a shopping list by adding items to a table view.

import UIKit

class ShoppingList: UITableViewController
{
	var shoppingList: [String] = []

	override func viewDidLoad()
	{
		super.viewDidLoad()
		title = "Shopping List"
		
		navigationItem.rightBarButtonItem =
			UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addToShoppingList))
		
		navigationItem.leftBarButtonItem =
			UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(removeItemsShare))
	}

	//tableview/////////////////////////////////////////////////////////////////
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
	{
		return shoppingList.count
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
	{
		let cell = tableView.dequeueReusableCell(withIdentifier: "listItem", for: indexPath)
		cell.textLabel?.text = shoppingList[indexPath.row]
		return cell
	}

	//@objc/////////////////////////////////////////////////////////////////////
	@objc func removeItemsShare()
	{
		let ac = UIAlertController(title: "Remove All / Share", message: nil, preferredStyle: .actionSheet)

		ac.addAction(UIAlertAction(title: "Remove ALL", style: .default, handler:
		{
			(alert: UIAlertAction) -> Void in
			self.shoppingList.removeAll()
			self.tableView.reloadData()
		}))

		ac.addAction(UIAlertAction(title: "Share Shopping List", style: .default, handler:
		{
			(alert: UIAlertAction) -> Void in
			//put list in string
			let sl = self.shoppingList.joined(separator: "\n")
			//share view
			let vc = UIActivityViewController(activityItems: [sl], applicationActivities: [])
			self.present(vc, animated: true)
		}))

		present(ac, animated: true)
	}

	@objc func addToShoppingList()
	{
		let ac = UIAlertController(title: "Enter Item:", message: nil, preferredStyle: .alert)
		//add textfield
		ac.addTextField()
		//grab text
		let submitItem = UIAlertAction(title: "Submit", style: .default)
		{
			[weak self, weak ac] action in
			guard let item = ac?.textFields?[0].text  else { return }
			self?.addToTable(item)
		}

		ac.addAction(submitItem)
		present(ac, animated: true)
	}

	//func/////////////////////////////////////////////////////////////////////
	func addToTable(_ item: String)
	{
		shoppingList.insert(item, at: 0)
		let ip = IndexPath(row: 0, section: 0)
		tableView.insertRows(at: [ip], with: .automatic)
		print(shoppingList)
	}
}
