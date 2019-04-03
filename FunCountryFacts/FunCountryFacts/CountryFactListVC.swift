//
//  CountryFactListVC.swift
//  FunCountryFacts
//
//  Created by Hector Steven on 4/1/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import UIKit

class CountryFactListVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
	var country: CountryFacts?
	fileprivate let tableView = UITableView()
	fileprivate let cellId = "cellid"

    override func viewDidLoad() {
        super.viewDidLoad()
		title = country?.country.uppercased()
		view.backgroundColor = .white
		setupTV()
    }
	
	fileprivate func setupTV() {
		view.addSubview(tableView)
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
		tableView.translatesAutoresizingMaskIntoConstraints = false
		tableView.delegate = self
		tableView.dataSource = self
		view.setupTableViewAnchor(tableView: tableView, view: view)
	}
}

extension CountryFactListVC {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if let size = country?.facts.count {
			return size
		}
		return 12
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
		cell.backgroundColor = .white
		cell.textLabel?.numberOfLines = 0
		cell.textLabel?.text = country?.facts[indexPath.row]
		return cell
	}
}
