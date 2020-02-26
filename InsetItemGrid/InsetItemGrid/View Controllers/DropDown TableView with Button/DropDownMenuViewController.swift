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
        dropDownButton = DropDownButton()
        dropDownButton.translatesAutoresizingMaskIntoConstraints = false
        dropDownButton.setTitle("Words", for: .normal)
        view.addSubview(dropDownButton)


        NSLayoutConstraint.activate([
            dropDownButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            dropDownButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            dropDownButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
        ])
    }
}
