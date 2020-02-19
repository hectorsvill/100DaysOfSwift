//
//  DropDownMenuViewController.swift
//  InsetItemGrid
//
//  Created by s on 2/18/20.
//  Copyright © 2020 s. All rights reserved.
//

import UIKit

class DropDownMenuViewController: UIViewController {


    var dropDownButton = DropDownButton()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        createButton()
    }

    private func createButton() {
        dropDownButton = DropDownButton(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        dropDownButton.translatesAutoresizingMaskIntoConstraints = false
        dropDownButton.setTitle("Words", for: .normal)
        view.addSubview(dropDownButton)

        let inset: CGFloat = 8
        NSLayoutConstraint.activate([
            dropDownButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: inset),
            dropDownButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: inset),
            dropDownButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -inset),
            dropDownButton.widthAnchor.constraint(equalToConstant: 100),
            dropDownButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
}

class DropDownMenuView: UIView, UITableViewDelegate {
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
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),
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


// MARK: DROPDOWNBUTTON

class DropDownButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .systemGray2
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}
