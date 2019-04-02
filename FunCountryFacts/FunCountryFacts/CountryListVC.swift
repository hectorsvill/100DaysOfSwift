//
//  CountryListVC.swift
//  FunCountryFacts
//
//  Created by Hector Steven on 4/1/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import UIKit

class CountryListVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
	
	let tableView = UITableView()
	let countriesList = CountriesInfo().getCountriesList()
	let cellId = "cellid"
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		view.backgroundColor = .white
		title = "Fun Country Facts"
		
		setupTableView()
    }
	
	///////////////////////////////////////////////////////////////////////////
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return countriesList.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
		cell.accessoryType = .disclosureIndicator
		cell.textLabel?.text = countriesList[indexPath.row]
		return cell
	}
	
	func setupTableView() {
		
		view.addSubview(tableView)
		tableView.translatesAutoresizingMaskIntoConstraints = false
		tableView.delegate = self
		tableView.dataSource = self
		
		NSLayoutConstraint.activate([
			tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
			tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
			tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
			
			])
		
		
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)

	}
	
	
}
