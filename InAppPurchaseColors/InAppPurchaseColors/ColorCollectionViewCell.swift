//
//  ColorCollectionViewCell.swift
//  InAppPurchaseColors
//
//  Created by s on 3/26/20.
//  Copyright © 2020 s. All rights reserved.
//

import UIKit

class ColorCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "Cell"
    var i: Int? { didSet { setupView() }}

    var buyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "Unlock All Colors for $0.99"
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }()

    private func setupView() {
        backgroundColor = .systemPink
        addSubview(buyLabel)

        NSLayoutConstraint.activate([
            buyLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            buyLabel.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),

        ])



    }

}
