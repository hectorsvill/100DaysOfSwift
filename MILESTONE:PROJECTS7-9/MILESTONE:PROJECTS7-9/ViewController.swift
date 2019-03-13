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
		
		let HintButton = UIButton(type: .system)
		HintButton.translatesAutoresizingMaskIntoConstraints = false
		HintButton.setTitle("Get Hint!", for: .normal)
		HintButton.titleLabel?.font = UIFont.systemFont(ofSize: 22)
		let frame = CGRect(x: 0, y: 0, width: 40, height: 40)
		HintButton.frame = frame
		HintButton.layer.borderWidth = 1
		HintButton.layer.cornerRadius = 5
		HintButton.addTarget(self, action: #selector(getHint), for: .touchUpInside)
		view.addSubview(HintButton)
		
		CharButtonView = UIView()
		CharButtonView.translatesAutoresizingMaskIntoConstraints = false
		CharButtonView.layer.borderWidth = 1
		CharButtonView.backgroundColor = .red
		view.addSubview(CharButtonView)
		
		CharButttonsUsed = createCharButtonArr(width: 20, height: 20)
		
		
		
		

		
		NSLayoutConstraint.activate([
			
//			HintButton.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 10),
			HintButton.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -100),
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
		
		for row in 0..<4 {
			for col in 0..<4 {
				let charButton = UIButton(type: .system)
				charButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
				let title = "a"
				charButton.setTitle(title, for: .normal)
				print("x:\(col * width) y:\(row * height) width: \(width) height: \(height)")
				let frame = CGRect(x: col * width, y: row * height, width: width, height: height)
				charButton.frame = frame
				charButton.layer.borderWidth = 1
				charButton.layer.cornerRadius = 2
				//charButton.addTarget(<#T##target: Any?##Any?#>, action: <#T##Selector#>, for: <#T##UIControl.Event#>)
				CharButtonView.addSubview(charButton)
				
				arrButton.append(charButton)
				index += 1
			}
		}
		
		return arrButton
	}
	
}
