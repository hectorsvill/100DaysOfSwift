//
//  DropDownMenuViewController.swift
//  InsetItemGrid
//
//  Created by s on 2/18/20.
//  Copyright © 2020 s. All rights reserved.
//

import UIKit

class DropDownMenuViewController: UIViewController {
    var dropDownButton: DropDownButton! = nil
    var dropDownButton2: DropDownButton! = nil

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

//
//        dropDownButton2 = DropDownButton(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
//        dropDownButton2.translatesAutoresizingMaskIntoConstraints = false
//        dropDownButton2.setTitle("Words2", for: .normal)
//        view.addSubview(dropDownButton2)


        let inset: CGFloat =  8

        NSLayoutConstraint.activate([
            dropDownButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: inset),
            dropDownButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: inset),
            dropDownButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -inset),

//            dropDownButton2.topAnchor.constraint(equalTo: dropDownButton.bottomAnchor, constant: inset),
//            dropDownButton2.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: inset),
//            dropDownButton2.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -inset),

        ])
    }
}

// MARK: DROPDOWNBUTTON
class DropDownButton: UIButton {
    var dropDownMenuTableView = DropDownMenuTableView()
    var height_Anchor = NSLayoutConstraint()
    var isOPen = false
    var tableviewHeight:CGFloat = 200
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    override func didMoveToSuperview() {

        backgroundColor = .systemGray2
        dropDownMenuTableView = .init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        
        dropDownMenuTableView.translatesAutoresizingMaskIntoConstraints = false
        superview?.addSubview(dropDownMenuTableView)

        NSLayoutConstraint.activate([
            dropDownMenuTableView.topAnchor.constraint(equalTo: bottomAnchor),
            dropDownMenuTableView.centerXAnchor.constraint(equalTo: centerXAnchor),
            dropDownMenuTableView.widthAnchor.constraint(equalTo: widthAnchor)
            
        ])
        height_Anchor = dropDownMenuTableView.heightAnchor.constraint(equalToConstant: 0)
        height_Anchor.isActive = true
    }


    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !isOPen {
            height_Anchor.constant = tableviewHeight
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.2, options: .curveEaseOut, animations: {
                self.dropDownMenuTableView.layoutIfNeeded()
                self.dropDownMenuTableView.center.y += self.dropDownMenuTableView.frame.height / 2
            }) { _ in

            }
        } else {
            height_Anchor.constant = 0
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.2, options: .curveEaseInOut, animations: {
                self.dropDownMenuTableView.center.y -= self.dropDownMenuTableView.frame.height / 2
                self.dropDownMenuTableView.layoutIfNeeded()
            }) { _ in

            }
        }


        isOPen.toggle()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}

// MARK: DropDownMenuView
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
        tableView = UITableView()
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

        dataSource = UITableViewDiffableDataSource<Section, Int>(tableView: tableView, cellProvider: { tableView, indexPath, i -> UITableViewCell? in
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            cell.textLabel?.text = "\(indexPath.row)"
            cell.backgroundColor = .systemGray4
            return cell
        })

        var snapShot = NSDiffableDataSourceSnapshot<Section, Int>()
        snapShot.appendSections([.main])
        snapShot.appendItems(Array(0...10))
        dataSource.apply(snapShot, animatingDifferences: true)

    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}


