//
//  ViewController.swift
//  SimpleCalculator
//
//  Created by Hector Steven on 3/11/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//


/*

IOS Simulator: Iphone XS

*/



import UIKit

class ViewController: UIViewController {

	var totalLabel: UILabel!
	var inputText: UITextField!
	var inputButtons = [UIButton]()


	
	override func loadView() {
		view = UIView()
		view.backgroundColor = UIColor.lightGray
	
		totalLabel = UILabel()
		totalLabel.translatesAutoresizingMaskIntoConstraints = false
//		totalLabel.frame = CGRect(x: 100, y: 270, width: 250, height: 60)
		totalLabel.font = UIFont.systemFont(ofSize: 30)
		totalLabel.textAlignment = .center
		totalLabel.text = "0"
		totalLabel.layer.borderWidth = 2
		totalLabel.layer.cornerRadius = 10
		//totalLabel.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)
		view.addSubview(totalLabel)
		
		inputText = UITextField()
		inputText.translatesAutoresizingMaskIntoConstraints = false
		//inputText.frame = CGRect(x: 100, y: 340, width: 250, height: 60)
		inputText.font = UIFont.systemFont(ofSize: 30)
		inputText.textAlignment = .center
		inputText.placeholder = "0 + 0"
		inputText.layer.borderWidth = 2
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
		//init button text
		inputButtons[2].titleLabel?.text = "1"
		
		
		
		NSLayoutConstraint.activate([
			
			totalLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 200),
			totalLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 10),
			totalLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4),
			
			inputText.topAnchor.constraint(equalTo: totalLabel.bottomAnchor, constant: 20),
			inputText.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 10),
			inputText.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4),
			
			
			
			//buttonView.widthAnchor.constraint(equalToConstant: 350),
			buttonView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
			buttonView.heightAnchor.constraint(equalToConstant: 200),
			buttonView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 10),
			buttonView.topAnchor.constraint(equalTo: inputText.bottomAnchor, constant: 20)
			
			
			
			])
	}
	
	
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		
	}


	
	@objc func getInputButton(_ sender: UIButton) {
		
		var total = "0"
		var input = "0"
		
		guard let senderTitle = sender.titleLabel?.text else { return }
		
		print(senderTitle)
		
		if senderTitle == "C" {
			total = "0"
			input = "0"
		} else if senderTitle == "=" {
			//calculate string
			//inputText == 0
		
		} else if senderTitle == "+" {
			//clear inputstr and calc total str
		} else if senderTitle == "-" {
			
		} else if senderTitle == "x" {
			
		} else if senderTitle == "/" {
			
		}
		
		
		totalLabel.text = total
		inputText.placeholder = input
		
		
	}
	
}

