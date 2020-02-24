//
//  ItemCollectionViewCell.swift
//  InsetItemGrid
//
//  Created by s on 2/24/20.
//  Copyright © 2020 s. All rights reserved.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {

    var itemTitle: String? { didSet { setupViews() }}
    var isDown = false

    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "arrow.turn.up.right")
        return imageView
    }()

    var itemTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .headline)

        return label
    }()


    private func setupViews() {
        guard let itemTitle = itemTitle else { return }

        itemTitleLabel.text = itemTitle

        contentView.addSubview(imageView)
        contentView.addSubview(itemTitleLabel)

        NSLayoutConstraint.activate([

            imageView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 16),
            imageView.heightAnchor.constraint(equalToConstant: 40),
            imageView.widthAnchor.constraint(equalToConstant: 40),
            imageView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),


            itemTitleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            itemTitleLabel.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 16),
            itemTitleLabel.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),
            itemTitleLabel.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),

        ])


    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        imageView.image =  isDown ? UIImage(systemName: "arrow.turn.right.down") : UIImage(systemName: "arrow.turn.up.right")
        isDown.toggle()
    }

}
