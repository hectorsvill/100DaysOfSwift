//
//  ViewController.swift
//  Project4
//
//  Created by Hector Steven on 2/24/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

	var Flags: [String] = ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
	
	override func viewDidLoad()
	{
		super.viewDidLoad()
		
		let fm = FileManager.default
		let path = Bundle.main.resourcePath!
		let items = try! fm.contentsOfDirectory(atPath: path)
		
		for i in  items
		{
			print(i)
		}
		
	
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		 return Flags.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "FlagPicture", for: indexPath)
		
		cell.imageView?.image = UIImage(named: Flags[indexPath.row])
		
		
		
		cell.textLabel?.text = Flags[indexPath.row].uppercased()
		
		
		return cell
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController
		{
			vc.selectedFlag = Flags[indexPath.row]
			navigationController?.pushViewController(vc, animated: true)
		}
	}
	
}

