//
//  ViewController.swift
//  Project6b
//
//  Created by Hector Steven on 3/3/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		
		let label1 = createLabel(text: "First", backgroundColor: .red)
		let label2 = createLabel(text: "Second", backgroundColor: .blue)
		let label3 = createLabel(text: "Third", backgroundColor: .green)
		let label4 = createLabel(text: "Fourth", backgroundColor: .brown)
		let label5 = createLabel(text: "Fith", backgroundColor: .cyan)
		
		view.addSubview(label1)
		view.addSubview(label2)
		view.addSubview(label3)
		view.addSubview(label4)
		view.addSubview(label5)
		
		let viewsDictionary = ["label1": label1, "label2": label2, "label3": label3, "label4": label4, "label5": label5]
		
		
		for label in viewsDictionary.keys{
			view.addConstraints(NSLayoutConstraint.constraints(
				withVisualFormat: "H:|[\(label)]|", options: [],
				metrics: nil, views: viewsDictionary))
		}
		
		let verticalConstraints = "V:|[label1(==88)]-[label2(==88)]-[label3(==88)]-[label4(==88)]-[label5(==88)]-(>=10)-|"
		
		view.addConstraints(NSLayoutConstraint.constraints(
			withVisualFormat: verticalConstraints,
			options: [], metrics: nil, views: viewsDictionary))
	
	}

	func createLabel(text: String, backgroundColor: UIColor) -> UILabel
	{
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.backgroundColor = backgroundColor
		label.text = text
		label.sizeToFit()

		return label
	}

}

