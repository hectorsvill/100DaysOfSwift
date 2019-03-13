//
//  ViewController.swift
//  MILESTONE:PROJECTS7-9
//
//  Created by Hector Steven on 3/13/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//
// HangMan Word Game

import UIKit



class ViewController: UIViewController {
	
	var CharButttonsUsed = [UIButton]()
	var CharButtonView: UIView!

	override func loadView() {
		view = UIView()
		view.backgroundColor = UIColor.lightGray
		let hintButtonTitle = "GET A HINT!"

		let HintButton = UIButton(type: .system)
		HintButton.translatesAutoresizingMaskIntoConstraints = false
		HintButton.setTitle(hintButtonTitle, for: .normal)
		HintButton.titleLabel?.font = UIFont.systemFont(ofSize: 22)
		HintButton.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
		HintButton.layer.borderWidth = 1
		HintButton.layer.cornerRadius = 5
		HintButton.addTarget(self, action: #selector(getHint), for: .touchUpInside)
		view.addSubview(HintButton)

		CharButtonView = UIView()
		CharButtonView.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(CharButtonView)

		CharButttonsUsed = createCharButtonArr(width: 50, height: 50)

		NSLayoutConstraint.activate([
			HintButton.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -50),
			HintButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			HintButton.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.4),

			CharButtonView.widthAnchor.constraint(equalToConstant: 300),
			CharButtonView.heightAnchor.constraint(equalToConstant: 250),
			CharButtonView.bottomAnchor.constraint(equalTo: HintButton.topAnchor, constant: -20),
			CharButtonView.centerXAnchor.constraint(equalTo: view.centerXAnchor),

			])
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}
	
	//objc func///////////////////////////////////////////////////////
	@objc func getHint() {
		print("get hint")
	}

	//func//////////////////////////////////////////////////////////////
	
	func createCharButtonArr(width: Int, height: Int) -> [UIButton] {
		var arrButton = [UIButton]()
		var index = 0
		var colreduce = 6

		for row in 0..<5 {
			for col in 0..<6 {
				if index >= 26 { break }

				let charButton = UIButton(type: .system)
				charButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)

				let title = UnicodeScalar(97 + index)! // return char
				charButton.setTitle(String(title), for: .normal)

				let frame = CGRect(x: col * width, y: row * height, width: (width) - 2 , height: height - 2)
				charButton.frame = frame
				
				charButton.layer.borderWidth = 1
				charButton.layer.cornerRadius = 10

				charButton.addTarget(self, action: #selector(hangMan), for: .touchUpInside)
				CharButtonView.addSubview(charButton)

				arrButton.append(charButton)
				index += 1
				colreduce -= 1
				print("x:\(col * width) y:\(row * height) width: \(width) height: \(height)")
			}
		}
		
//		NSLayoutConstraint.activate(cons)
		return arrButton
	}
	
	@objc func hangMan(_ sender: UIButton) {
		
		
		let title = (sender.titleLabel?.text)!
		print(title)
	}
	
}
