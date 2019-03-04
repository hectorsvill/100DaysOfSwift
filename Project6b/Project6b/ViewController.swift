//
//  ViewController.swift
//  Project6b
//
//  Created by Hector Steven on 3/3/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

//https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/ProgrammaticallyCreatingConstraints.html

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
		
//		let viewsDictionary = ["label1": label1,
//							   "label2": label2,
//							   "label3": label3,
//							   "label4": label4,
//							   "label5": label5]
		
		
//		for label in viewsDictionary.keys{
//			view.addConstraints(NSLayoutConstraint.constraints(
//				withVisualFormat: "H:|[\(label)]|", options: [],
//				metrics: nil, views: viewsDictionary))
//		}
//
//		let verticalConstraints = "V:|[label1(labelHeight@999)]-[label2(label1)]-[label3(label1)]-[label4(label1)]-[label5(label1)]-(>=10)-|"
//
//		let metrics = ["labelHeight": 88]
//
//		view.addConstraints(NSLayoutConstraint.constraints(
//			withVisualFormat: verticalConstraints,
//			options: [], metrics: metrics, views: viewsDictionary))
	
		var previous: UILabel?
		
		for label in [label1, label2, label3, label4, label5]
		{
			//anchers to left
			//label.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
			//anchers to right
			//label.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true

			label.heightAnchor.constraint(equalToConstant: 88).isActive = true
			label.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
			
			
			label.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.5, constant: 50).isActive = true
			label.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.2, constant: 30).isActive = true
			
			
			if let previous = previous{
				label.topAnchor.constraint(equalTo: previous.bottomAnchor, constant: 10).isActive = true
			}
			previous = label
		}
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

