//
//  Weblist.swift
//  MySwiftWebsites
//
//  Created by Hector Steven on 2/26/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import UIKit

class Weblist: UITableViewController {

	let cellid = "WebsiteList"
	let Website = ["hackingwithswift.com", "developer.apple.com", "swiftbysundell.com", "raywenderlich.com", "github.com"]
	
	
	override func viewDidLoad()
	{
		super.viewDidLoad()
		
		title = "My Swift Websites"
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return Website.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
	{

		let cell = tableView.dequeueReusableCell(withIdentifier: cellid, for: indexPath)
		
		cell.textLabel?.text = Website[indexPath.row]
		cell.layer.borderColor = UIColor.lightGray.cgColor
		cell.layer.borderWidth = 0.2
		return cell
	}

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
	{
		//try loading "WEbDetail" view controler
		if let vc = storyboard?.instantiateViewController(withIdentifier: "Webdetail") as? DetailViewController
		{
			//set var in DetailViewControler.swift
			vc.selectedSite = Website[indexPath.row]
			navigationController?.pushViewController(vc, animated: true)
		}
	}
	
}
