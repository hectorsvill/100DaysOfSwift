//
//  CountryListCell.swift
//  FunCountryFacts
//
//  Created by Hector Steven on 4/1/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import UIKit

class CountryListCell: UITableViewCell {
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
	
		setup()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	let flagImageView: UIImageView = {
		let iv = UIImageView()
		iv.contentMode = .scaleAspectFill
		iv.translatesAutoresizingMaskIntoConstraints = false
		iv.clipsToBounds = true
		iv.layer.cornerRadius = 15
		
		return iv
	}()
	
	let flagNameLabel: UILabel = {
		let label = UILabel()
		label.font = UIFont.systemFont(ofSize: 25)
		label.translatesAutoresizingMaskIntoConstraints = false
		
		return label
	}()
	
	func setup() {
		[flagImageView, flagNameLabel].forEach({ self.contentView.addSubview( $0 ) })
		
		NSLayoutConstraint.activate([
			
			
			flagImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
			flagImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
			flagImageView.widthAnchor.constraint(equalToConstant: 120),
			flagImageView.heightAnchor.constraint(equalToConstant: 80),
			
			flagNameLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
			flagNameLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10)
			
			
			])
		
	}
}
