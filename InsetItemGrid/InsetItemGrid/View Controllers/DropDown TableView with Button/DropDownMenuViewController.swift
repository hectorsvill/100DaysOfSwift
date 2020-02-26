//
//  DropDownMenuViewController.swift
//  InsetItemGrid
//
//  Created by s on 2/18/20.
//  Copyright © 2020 s. All rights reserved.
//

import UIKit

class DropDownMenuViewController: UITableViewController {
    enum Section {
        case main
        case sub
        case mid
    }

    var data: [Int : [Int]] = [
        0: [],
        1: [],
        2: [],
        3: [],
        4: [],
        5: [],
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        createView()
    }

    private func createView() {
        view.backgroundColor = .gray
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }

    @objc func buttonClicked(_ sender: UIButton) {
        let section = sender.tag
//        let count = tableView.numberOfRows(inSection: section) == 0 ? 5 : 0
//        data[section]! = Array(0..<count)
//        tableView.reloadData()

        if tableView.numberOfRows(inSection: section) == 0 {
            data[section]! = Array(0...5)
            let indexPaths: [IndexPath] = data[section]!.map {
                return IndexPath(row: $0, section: section)
            }

            tableView.insertRows(at: indexPaths, with: .fade)
        } else {
            let indexPaths: [IndexPath] = data[section]!.map {
                return IndexPath(row: $0, section: section)
            }
            data[section]!.removeAll()
            tableView.deleteRows(at: indexPaths, with: .fade)
        }

    }
}


extension DropDownMenuViewController {
    private func headerButton(_ section: Int) -> UIButton {
        let button = UIButton()
        button.setTitle("section \(section)", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.backgroundColor = .gray
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 3
        button.layer.cornerRadius = 8
        button.tag = section
        button.addTarget(self, action: #selector(buttonClicked(_:)), for: .touchUpInside)
        return button
    }

    override func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return headerButton(section)
    }


    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(section)"
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section]!.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "\(indexPath)"
        return cell
    }
}
