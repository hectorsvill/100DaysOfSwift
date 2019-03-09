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
//		cluesLabel.textAlignment = .right
		view.addSubview(cluesLabel)
		
		answerLabel = UILabel()
		answerLabel.translatesAutoresizingMaskIntoConstraints = false
		answerLabel.font = UIFont.systemFont(ofSize: 24)
		answerLabel.text = "ANSWERS"
		answerLabel.numberOfLines = 0
		answerLabel.textAlignment = .right
		view.addSubview(answerLabel)
		
		NSLayoutConstraint.activate([
			scoreLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
			scoreLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
			
			// pin the top of the cluses label to the bottom of the score label
			cluesLabel.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor),
			// pin the leading edge of the clues label to the leading edge of our layout margins, adding 100 for some space
			cluesLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 100),
			//make the clueless label 60% of the width of our layout margins, minus 100
			cluesLabel.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.6, constant: -100),
			
			answerLabel.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor),
			answerLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -100),
			answerLabel.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.4, constant: -100)
			
			
			
			])
		
		cluesLabel.backgroundColor = UIColor.gray
		answerLabel.backgroundColor = UIColor.green
		scoreLabel.backgroundColor = UIColor.brown
		
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}


}

