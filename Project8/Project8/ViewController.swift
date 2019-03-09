//
//  ViewController.swift
//  Project8
//
//  Created by Hector Steven on 3/8/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	var cluesLabel: UILabel!
	var answerLabel: UILabel!
	var currentAnswer: UITextField!
	var scoreLabel: UILabel!
	var letterButtons = [UIButton]()
	
	override func loadView() {
		view = UIView()
		view.backgroundColor = .white
		
		scoreLabel = UILabel()
		
		scoreLabel.translatesAutoresizingMaskIntoConstraints = false
		scoreLabel.textAlignment = .right
		scoreLabel.text = "Score: 0"
		view.addSubview(scoreLabel)
		
		cluesLabel = UILabel()
		cluesLabel.translatesAutoresizingMaskIntoConstraints = false
		cluesLabel.font = UIFont.systemFont(ofSize: 24)
		cluesLabel.text = "CLUES"
		cluesLabel.numberOfLines = 0
		cluesLabel.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)
		view.addSubview(cluesLabel)
		
		answerLabel = UILabel()
		answerLabel.translatesAutoresizingMaskIntoConstraints = false
		answerLabel.font = UIFont.systemFont(ofSize: 24)
		answerLabel.text = "ANSWERS"
		answerLabel.numberOfLines = 0
		answerLabel.textAlignment = .right
		answerLabel.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)
		view.addSubview(answerLabel)
		
		currentAnswer = UITextField()
		currentAnswer.translatesAutoresizingMaskIntoConstraints = false
		currentAnswer.placeholder = "Tap letters to guess"
		currentAnswer.textAlignment = .center
		currentAnswer.font = UIFont.systemFont(ofSize: 44)
		currentAnswer.isUserInteractionEnabled = false
		view.addSubview(currentAnswer)
		
		let submit = UIButton(type: .system)
		submit.translatesAutoresizingMaskIntoConstraints = false
		submit.setTitle("SUBMIT", for: .normal)
		view.addSubview(submit)

		let clear = UIButton(type: .system)
		clear.translatesAutoresizingMaskIntoConstraints = false
		clear.setTitle("CLEAR", for: .normal)
		view.addSubview(clear)

		let buttonView = UIView()
		buttonView.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(buttonView)
		
		
		
		NSLayoutConstraint.activate([
			scoreLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
			scoreLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
			
			cluesLabel.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor),
			cluesLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 100),
			cluesLabel.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.6, constant: -100),
			
			
			answerLabel.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor),
			answerLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -100),
			answerLabel.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.4, constant: -100),
			answerLabel.heightAnchor.constraint(equalTo: cluesLabel.heightAnchor),
			
			currentAnswer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			currentAnswer.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
			currentAnswer.topAnchor.constraint(equalTo: cluesLabel.bottomAnchor, constant: 20),
			
			submit.topAnchor.constraint(equalTo: currentAnswer.bottomAnchor),
			submit.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -100),
			submit.heightAnchor.constraint(equalToConstant: 40),
			
			clear.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 100),
			clear.centerYAnchor.constraint(equalTo: submit.centerYAnchor),
			clear.heightAnchor.constraint(equalToConstant: 44),
			
			buttonView.widthAnchor.constraint(equalToConstant: 750),
			buttonView.heightAnchor.constraint(equalToConstant: 320),
			buttonView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			buttonView.topAnchor.constraint(equalTo: submit.bottomAnchor, constant: 20),
			buttonView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -20),
		])
		
		
//
//		buttonView.backgroundColor = .green
//		cluesLabel.backgroundColor = .gray
//		answerLabel.backgroundColor = .blue
//		scoreLabel.backgroundColor = UIColor.brown
//		currentAnswer.backgroundColor = UIColor.red
		
		
		
		let width = 150
		let height = 80
		
		for row in 0..<4{
			for col in 0..<5 {
				let letterButton = UIButton(type: .system)
				letterButton.titleLabel?.font = UIFont.systemFont(ofSize: 36)
				letterButton.setTitle("HHH", for: .normal)
				
				let frame = CGRect(x: col * width, y: row * height, width: width, height: height)
				letterButton.frame = frame
				
				buttonView.addSubview(letterButton)
				letterButtons.append(letterButton)
			}
		}
		
		
		
		
		
		
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}


}

