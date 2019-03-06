//
//  ViewController.swift
//  Project7
//
//  Created by Hector Steven on 3/5/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

//https://developer.apple.com/swift/blog/?id=37



import UIKit

class ViewController: UITableViewController {
	
	let cellid = "Cell"				//cell id
	let navid = "NavController"		// navigatione controller id
	var petitions = [Petition]()	// Define the kinds of data structures we want to load the JSON into.

	override func viewDidLoad() {
		super.viewDidLoad()
		title = "US Petitions"

		let hwsweb = "https://www.hackingwithswift.com/samples/petitions-1.json"
//		let urlStr = "https://api.whitehouse.gov/v1/petitions.json?limit=100"
		if let url = URL(string: hwsweb){
		if let data = try? Data(contentsOf: url){
				parse(json: data)
			}
		}
		
	}

	//tableView////////////////////////////////////////////////////////////////
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return petitions.count
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
		let p = petitions[indexPath.row]
		cell.textLabel?.text = p.title
		cell.detailTextLabel?.text = p.body
		return cell
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let vc = DetailViewController()
		vc.detailItem = petitions[indexPath.row]
		navigationController?.pushViewController(vc, animated: true)
	}
	

	//func/////////////////////////////////////////////////////////////////////
	func parse(json: Data) {
		let decoder = JSONDecoder()
		if let jsonPetitions = try? decoder.decode(Petitions.self, from: json) {
			petitions = jsonPetitions.results
			tableView.reloadData()
		}
	}
}

