//
//  UIViewExtension.swift
//  FunCountryFacts
//
//  Created by Hector Steven on 4/3/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import UIKit

extension UIView {
	func setupTableViewAnchor(tableView: UITableView, view: UIView) {
		NSLayoutConstraint.activate([
			tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
			tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
			tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
			])
	}
}
