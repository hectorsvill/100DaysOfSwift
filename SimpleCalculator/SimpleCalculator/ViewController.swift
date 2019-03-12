//
//  ViewController.swift
//  SimpleCalculator
//
//  Created by Hector Steven on 3/11/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//
//IOS Simulator: Iphone XS


import UIKit

class ViewController: UIViewController {

	var totalLabel: UILabel!
	var inputText: UITextField!
	var inputButtons = [UIButton]()
	
	let sCalc = Calc()
	
	override func loadView() {
		view = UIView()
		view.backgroundColor = UIColor.lightGray
	
		totalLabel = UILabel()
		totalLabel.translatesAutoresizingMaskIntoConstraints = false
		totalLabel.font = UIFont.systemFont(ofSize: 30)
		totalLabel.textAlignment = .center
		totalLabel.text = "_"
		totalLabel.layer.borderWidth = 2
		totalLabel.layer.cornerRadius = 10
		view.addSubview(totalLabel)

		inputText = UITextField()
		inputText.translatesAutoresizingMaskIntoConstraints = false
		inputText.font = UIFont.systemFont(ofSize: 30)
		inputText.textAlignment = .center
		inputText.placeholder = "_"
		inputText.layer.borderWidth = 2
		inputText.isUserInteractionEnabled = false
		inputText.layer.cornerRadius = 10
		view.addSubview(inputText)

		let buttonView = UIView()
		buttonView.translatesAutoresizingMaskIntoConstraints = false
		//buttonView.layer.borderWidth = 2
		view.addSubview(buttonView)

		let width = 75
		let height = 50
		var index = 0

		for row in 0..<4 {
			for col in 0..<4 {
				let calcButton = UIButton(type: .system)
				calcButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)

				let title = Calc().calcButtonText(index: index)
				calcButton.setTitle(title, for: .normal)

				let frame = CGRect(x: col * width, y: row * height, width: width, height: height)
				calcButton.frame = frame
				calcButton.addTarget(self, action: #selector(getInputButton), for: .touchUpInside)
				calcButton.layer.borderWidth = 2
				calcButton.layer.cornerRadius = 10
				buttonView.addSubview(calcButton)
				inputButtons.append(calcButton)

				index += 1
			}
		}

		NSLayoutConstraint.activate([
			totalLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 200),
			totalLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 10),
			totalLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),

			inputText.topAnchor.constraint(equalTo: totalLabel.bottomAnchor, constant: 20),
			inputText.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 10),
			inputText.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),

			buttonView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
			buttonView.heightAnchor.constraint(equalToConstant: 200),
			buttonView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 10),
			buttonView.topAnchor.constraint(equalTo: inputText.bottomAnchor, constant: 20),

			])
	}

	//objc func///////////////////////////////////////////////////////
	@objc func getInputButton(_ sender: UIButton) {

		guard let senderTitle = sender.titleLabel?.text else {
			print("Error: SenderTitle")
			return
		}

		calculate(str: senderTitle)
	}

	//func//////////////////////////////////////////////////////////////////
	func calculate(str: String) {

		var inputStr = "_"
		var totalStr = "_"

		if str == "C" {
			clearAll()
		} else if str == "=" {

			let t1 = Int(sCalc.intArrToStr(sCalc.term1))!
			let t2 = Int(sCalc.intArrToStr(sCalc.term2))!

			totalStr = sCalc.operate(t1, t2)
			totalStr = String(totalStr)

			clearAll()
			sCalc.operate.removeAll()

		} else if sCalc.strIsInt(str) {
			// handle num input

			totalStr = "_"
			let num = Int(str)!
			
			if sCalc.operate.isEmpty {
				sCalc.term1.append(num)
				inputStr = sCalc.intArrToStr(sCalc.term1)
				sCalc.operate.removeAll()
			} else {
				sCalc.term2.append(num)
				inputStr = sCalc.intArrToStr(sCalc.term2)
			}

		} else {
			// its + - x /
			sCalc.operate.removeAll()
			if !sCalc.term1.isEmpty{
				sCalc.operate.append(Character(str))
			}

		}

		inputText.placeholder = inputStr
		totalLabel.text = totalStr
		print("t1: \(sCalc.term1)")
		print("t2: \(sCalc.term2)")
		print("op: \(sCalc.operate)")
	}

	func clearAll() {
		sCalc.term1.removeAll()
		sCalc.term2.removeAll()
		sCalc.operate.removeAll()
	}
}

