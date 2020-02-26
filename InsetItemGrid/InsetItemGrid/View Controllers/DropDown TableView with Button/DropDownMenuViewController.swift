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
        0: Array(0...1),
        1: Array(0...2),
        2: Array(0...3),
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
        print("button clicked \(section)")

        let count = tableView.numberOfRows(inSection: section)
        data[section]! = Array(0...count)
        tableView.reloadData()

    }
}


extension DropDownMenuViewController {

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let button = UIButton()
        button.setTitle("section \(section)", for: .normal)
        button.backgroundColor = .gray
        button.tintColor = .white
        button.tag = section
        button.addTarget(self, action: #selector(buttonClicked(_:)), for: .touchUpInside)
        return button
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





