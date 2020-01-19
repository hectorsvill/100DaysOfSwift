//
//  MenuTableViewCell.swift
//  slideMenu
//
//  Created by s on 1/18/20.
//  Copyright © 2020 h. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    var index: Int? {
        didSet { setupView() }
    }
    
    let iconImageview: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "Sample here"
        
        return label
    }()
    
    private func setupView() {
        iconImageview.image = UIImage(systemName: "wifi")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .gray
        
        iconImageview.translatesAutoresizingMaskIntoConstraints = false
        iconImageview.image = UIImage(systemName: "wifi")
        addSubview(iconImageview)
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            iconImageview.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconImageview.leftAnchor.constraint(equalTo: leftAnchor),
            iconImageview.heightAnchor.constraint(equalToConstant: 24),
            iconImageview.widthAnchor.constraint(equalToConstant: 24),
            
            descriptionLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            descriptionLabel.leftAnchor.constraint(equalTo: iconImageview.rightAnchor, constant: 16)

        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
 
}
