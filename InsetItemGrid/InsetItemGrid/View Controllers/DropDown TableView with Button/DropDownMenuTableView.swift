//
//  DropDownMenuTableView.swift
//  InsetItemGrid
//
//  Created by s on 2/18/20.
//  Copyright © 2020 s. All rights reserved.
//

import UIKit

class DropDownMenuTableView: UIView, UITableViewDelegate {
    enum Section {
        case main
    }

    var tableView: UITableView! = nil
    var dataSource: UITableViewDiffableDataSource<Section, Int>! = nil

    override init(frame: CGRect) {
        super.init(frame: frame)

        createTableView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func createTableView() {
        tableView = UITableView(frame: frame)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: leftAnchor),
            tableView.rightAnchor.constraint(equalTo: rightAnchor),
        ])

        dataSource = UITableViewDiffableDataSource<Section, Int>(tableView: tableView, cellProvider: {
            tableView, indexPath, i -> UITableViewCell? in

            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            cell.textLabel?.text = "\(indexPath.row)"
            cell.backgroundColor = .systemGray4
            return cell
        })

        var snapShot = NSDiffableDataSourceSnapshot<Section, Int>()
        snapShot.appendSections([.main])
        snapShot.appendItems(Array(0...4))
        dataSource.apply(snapShot, animatingDifferences: true)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}

