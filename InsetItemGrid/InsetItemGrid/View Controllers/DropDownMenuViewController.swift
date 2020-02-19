//
//  DropDownMenuViewController.swift
//  InsetItemGrid
//
//  Created by s on 2/18/20.
//  Copyright © 2020 s. All rights reserved.
//

import UIKit

class DropDownMenuViewController: UIViewController {
    enum Section {
        case main
    }

    var tableView: UITableView! = nil
    var dataSource: UITableViewDiffableDataSource<Section, Int>! = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        createTableView()
    }
}

extension DropDownMenuViewController: UITableViewDelegate {

    private func createTableView() {
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
        ])

        dataSource = UITableViewDiffableDataSource<Section, Int>(tableView: tableView, cellProvider: { tableView, indexPath, i -> UITableViewCell? in
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            cell.textLabel?.text = "\(indexPath.row)"
            return cell
        })

        var snapShot = NSDiffableDataSourceSnapshot<Section, Int>()
        snapShot.appendSections([.main])
        snapShot.appendItems(Array(0...100))
        dataSource.apply(snapShot, animatingDifferences: true)

    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }


}
