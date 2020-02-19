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

        let inset: CGFloat =  8

        NSLayoutConstraint.activate([
            dropDownButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: inset),
            dropDownButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: inset),
            dropDownButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -inset),
        ])
    }
}
