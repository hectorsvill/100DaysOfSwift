//
//  ExpandingTableViewController.swift
//  InsetItemGrid
//
//  Created by s on 2/19/20.
//  Copyright © 2020 s. All rights reserved.
//

import UIKit

class ExpandingTableViewController: UIViewController {

    enum Section {
        case main
    }

    var tableView: UITableView! = nil
    var datasource: UITableViewDiffableDataSource<Section, Int>! = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Expanding Table View Cells"
        createTableView()
    }

    private func createTableView() {
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true

        datasource = UITableViewDiffableDataSource<Section, Int>(tableView: tableView, cellProvider: { tableView, indexPath, i -> UITableViewCell? in
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

            cell.backgroundColor = .systemGray6
            cell.textLabel?.text = "\(indexPath.row)"

            return cell
        })

        var snapshot = NSDiffableDataSourceSnapshot<Section, Int>()
        snapshot.appendSections([.main])
        snapshot.appendItems(Array(0...22))
        datasource.apply(snapshot, animatingDifferences: true)
    }

}
