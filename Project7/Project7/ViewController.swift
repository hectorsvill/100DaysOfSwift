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
	var petitionsFiltered = [Petition]()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		title = "US Petitions"
		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(showCredit))
		navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(filterResult))
		
		// download JSON using Swift’s Data type
		let urlstr: String
		
		if navigationController?.tabBarItem.tag == 0 {
			urlstr = "https://api.whitehouse.gov/v1/petitions.json?limit=100"
		} else {
			urlstr = "https://www.hackingwithswift.com/samples/petitions-2.json"
		}
		
//		urlstr = "https://api.whitehouse.gov/v1/petitions.json?limit=100"
		if let url = URL(string: urlstr){
			if let data = try? Data(contentsOf: url){
				parse(json: data)
				return
			}
		}
		showError()
	}

	//@objc////////////////////////////////////////////////////////////////////

	@objc func showCredit() {
		let ac = UIAlertController(title: "Credit: ", message: "https://api.whitehouse.gov/v1/petitions.json?limit=100", preferredStyle: .alert)
		ac.addAction(UIAlertAction(title: "OK", style: .cancel))
		present(ac, animated: true)
	}
	
	@objc func filterResult() {
		
		let ac = UIAlertController(title: "Search", message: nil, preferredStyle: .alert)
		ac.addTextField()
		let filterStr = UIAlertAction(title: "Filter", style: .default){
			[weak self, weak ac] action in
			guard let filterText = ac?.textFields?[0].text else { return }
			self?.filterTheLIstTo(filterText: filterText)
		}
		ac.addAction(filterStr)
		present(ac, animated: true)
	}

	//tableView////////////////////////////////////////////////////////////////
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return petitions.count
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: cellid, for: indexPath)
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

	func showError() {
		let ac = UIAlertController(title: "Loading Error", message: "Error Loading your content", preferredStyle: .alert)
		ac.addAction(UIAlertAction(title: "OK", style: .cancel))
		present(ac, animated: true)
	}
	
	func filterTheLIstTo(filterText: String) {
		var pCopy = [Petition]()
		for p in petitions {
			let title  = p.title.lowercased()
			if title.contains(filterText.lowercased()){
				pCopy.append(p)
			}
		}
		petitions = pCopy
		tableView.reloadData()
		print(petitionsFiltered.count)
	}
}

