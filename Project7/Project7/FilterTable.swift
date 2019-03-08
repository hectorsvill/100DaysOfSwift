//
//  FilterTable.swift
//  Project7
//
//  Created by Hector Steven on 3/7/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import UIKit

class FilterTable: UITableViewController {

	let cellid = "FilterCell"
	let filterStr = String()

	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Filtered Petitions: " + filterStr
	
	
	
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}
	
	
}



//		var petitionsCopy = petitions
//
//		if filterText.isEmpty {
//			return
//		}
//
//		petitionsCopy.removeAll()
//		var index = 1
//		for p in petitions {
//			let title  = p.title.lowercased()
//			if title.contains(filterText.lowercased()){
//				petitionsCopy.append(p)
//			}
//			index += 1
//		}
//		for p in petitionsCopy {
//			print(p.title)
//		}

