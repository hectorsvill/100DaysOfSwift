//
//  CountryListVC.swift
//  FunCountryFacts
//
//  Created by Hector Steven on 4/1/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import UIKit

class CountryListVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
	
	fileprivate let tableView = UITableView()
	fileprivate let countriesList = CountriesInfo().getCountriesList()
	fileprivate let cellId = "cellid"
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		view.backgroundColor = .white
		title = "Fun Country Facts"
		setupTV()

    }
	
	///////////////////////////////////////////////////////////////////////////
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return countriesList.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! CountryListCell
		cell.accessoryType = .disclosureIndicator

		let str = countriesList[indexPath.row]
		let image =  UIImage(named: str)
		
		cell.flagImageView.image = image
		cell.flagNameLabel.text = str.uppercased()
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 85
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let vc = CountryFactListVC()
		vc.countryName = countriesList[indexPath.row]
		navigationController?.pushViewController(vc, animated: true)
		
		
	}
	
	///////////////////////////////////////////////////////////////////////////\
	
	fileprivate func setupTV() {
		
		view.addSubview(tableView)
		tableView.register(CountryListCell.self, forCellReuseIdentifier: cellId)
		tableView.translatesAutoresizingMaskIntoConstraints = false
		tableView.delegate = self
		tableView.dataSource = self
		
		NSLayoutConstraint.activate([
			tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
			tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
			tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
			])
	}
}
