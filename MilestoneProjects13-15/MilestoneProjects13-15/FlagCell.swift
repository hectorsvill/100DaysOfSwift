//
//  FlagCell.swift
//  MilestoneProjects13-15
//
//  Created by Hector Steven on 3/31/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import UIKit


class FlagCell: UITableViewCell {
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		setup()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	var countryLabel: UILabel = {
		let label = UILabel()
		label.text = "check"
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = .systemFont(ofSize: 34)

		return label
	}()

	
	
	func setup() {
		addSubview(countryLabel)
		addConstraint(
			NSLayoutConstraint.constraints(withVisualFormat: <#T##String#>, options: <#T##NSLayoutConstraint.FormatOptions#>, metrics: <#T##[String : Any]?#>, views: <#T##[String : Any]#>)
		)
		
	}


}
