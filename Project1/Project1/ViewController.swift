//
//  ViewController.swift
//  Project1
//
//  Created by Hector Steven on 2/19/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

	var pictueres = [String]()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		title = "Storm Viewer"
		navigationController?.navigationBar.prefersLargeTitles = true
		performSelector(inBackground: #selector(fetchImages), with: nil)
		tableView.reloadData()
	}
	
	@objc func fetchImages() {
		let fm = FileManager.default //data type that lets us work with the filesystem
		let path = Bundle.main.resourcePath! //directory path to pictures
		let items = try! fm.contentsOfDirectory(atPath: path)   //The items constant will be an array of strings containing filenames.

		for item in items {
			//set pictures
			if item.hasPrefix("nssl") {
				pictueres.append(item)
			}
		}
		pictueres = pictueres.sorted()
		for p in pictueres { print(p) }
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return pictueres.count
	}

	//cellfor -- set cell text
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
		//variable just holds a text -- pictures[indexPath.row]
		cell.textLabel?.text = "\(indexPath.row + 1) of \(pictueres.count)" //set text in each table
		return cell
	}

	//didselect -
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
			vc.selectedImage = pictueres[indexPath.row]
			navigationController?.pushViewController(vc, animated: true)
		}
	}
}

