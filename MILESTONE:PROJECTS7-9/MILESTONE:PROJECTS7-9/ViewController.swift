//
//  ViewController.swift
//  MILESTONE:PROJECTS7-9
//
//  Created by Hector Steven on 3/13/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//
// HangMan Word Game
//
//simulator: Iphone xs


import UIKit



class ViewController: UIViewController {
	var Play = PlayHangMan()
	var HintButton: UIButton!
	var CharButttonsUsed = [UIButton]()
	var CharButtonView: UIView!
	var WordLabel: UILabel!
	var HangManView: UIView!
	var HangmanLabel: UILabel!
	var ScoreLabel: UILabel!
	
	
	
	var wordHint = ""
	var wordLabelArr = [Character]()
	

	override func loadView() {
		view = UIView()
		view.backgroundColor = UIColor.lightGray

		getFile()
		createHintButton()
		createAzButtonArr()
		createStrLabel()
		createHangMan()
		

		
		NSLayoutConstraint.activate([
	
			HintButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			HintButton.heightAnchor.constraint(equalToConstant: 40),
			HintButton.widthAnchor.constraint(equalToConstant: 180),
			HintButton.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -50),


			CharButtonView.heightAnchor.constraint(equalToConstant: 215),
			CharButtonView.widthAnchor.constraint(equalToConstant: 300),
			CharButtonView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			CharButtonView.bottomAnchor.constraint(equalTo: HintButton.topAnchor, constant: -10),
//			CharButtonView.topAnchor.constraint(equalTo: WordLabel.topAnchor, constant: -10),
			
			WordLabel.heightAnchor.constraint(equalToConstant: 40),
			WordLabel.widthAnchor.constraint(equalToConstant: 300),
			WordLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			WordLabel.bottomAnchor.constraint(equalTo: CharButtonView.topAnchor, constant: -10),
			//WordLabel.topAnchor.constraint(equalTo: HangManView.bottomAnchor, constant: 20),

			HangManView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			HangManView.widthAnchor.constraint(equalToConstant: 300),
			HangManView.heightAnchor.constraint(equalToConstant: 210),
			HangManView.bottomAnchor.constraint(equalTo: WordLabel.topAnchor, constant: -20),

			HangManView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 80),
			
			
			])

			//Start Game
			loadLevel()
		
	}

	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	//objc func///////////////////////////////////////////////////////
	@objc func getHint() {
		//only provide 3 hints max
		print("get hint")
		

	}

	@objc func hangMan(_ sender: UIButton) {
		let title = (sender.titleLabel?.text)!
		print(title)
		
		
		
		
	}
	
	func getFile() {
		
		if let wordsURL = Bundle.main.url(forResource: "start", withExtension: ".txt") {
			if let startWords  = try? String(contentsOf: wordsURL) {
				let words = startWords.components(separatedBy: "\n")
				Play.wordArr = words
				return
			}
		}
		let ac = UIAlertController(title: "Error", message: "Loading Words Failed!", preferredStyle: .alert)
		ac.addAction(UIAlertAction(title: "OK", style: .cancel))
		present(ac, animated: true)
		
	}

	//func//////////////////////////////////////////////////////////////
	
	func createHintButton() {
		let hintButtonTitle = "GET A HINT!"
		HintButton = UIButton(type: .system)
		HintButton.translatesAutoresizingMaskIntoConstraints = false
		HintButton.setTitle(hintButtonTitle, for: .normal)
		HintButton.titleLabel?.font = UIFont.systemFont(ofSize: 22)
		HintButton.layer.borderWidth = 1
		HintButton.layer.cornerRadius = 5
		HintButton.addTarget(self, action: #selector(getHint), for: .touchUpInside)
		view.addSubview(HintButton)
	}

	func createAzButtonArr() {
		CharButtonView = UIView()
		CharButtonView.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(CharButtonView)
		CharButttonsUsed = createCharButtonArr(width: 50, height: 50)
//		CharButtonView.layer.borderWidth = 1
	}

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
				//print("x:\(col * width) y:\(row * height) width: \(width) height: \(height)")
			}
		}
		return arrButton
	}

	func createStrLabel() {
		WordLabel = UILabel()
		WordLabel.translatesAutoresizingMaskIntoConstraints = false
		WordLabel.font = UIFont.systemFont(ofSize: 44)
		WordLabel.textAlignment = .center
	 	WordLabel.text = "_ _"
		view.addSubview(WordLabel)

	}

	func createHangMan() {
		HangManView = UIView()
		HangManView.translatesAutoresizingMaskIntoConstraints = false
		HangManView.layer.borderWidth = 4
		HangManView.layer.cornerRadius = 10
		HangManView.backgroundColor = UIColor.white
		view.addSubview(HangManView)

		HangmanLabel = UILabel()
		HangmanLabel.translatesAutoresizingMaskIntoConstraints = false
		HangmanLabel.font = UIFont.systemFont(ofSize: 30)
		HangmanLabel.textAlignment = .center
		HangmanLabel.text = Play.drawHM()
		HangmanLabel.numberOfLines = 6
		HangManView.addSubview(HangmanLabel)
		
		ScoreLabel = UILabel()
		ScoreLabel.translatesAutoresizingMaskIntoConstraints = false
		ScoreLabel.font = UIFont.systemFont(ofSize: 15)
		ScoreLabel.text = "Streak: 0 "
		HangManView.addSubview(ScoreLabel)
		
		let HintLabel = UILabel()
		HintLabel.translatesAutoresizingMaskIntoConstraints = false
		HintLabel.font = UIFont.systemFont(ofSize: 15)
		HintLabel.text = "Hints: 10 / 10"
		HangManView.addSubview(HintLabel)
		
		NSLayoutConstraint.activate([
			HangmanLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -10),
			
			ScoreLabel.bottomAnchor.constraint(equalTo: HangManView.bottomAnchor, constant: -5),
			ScoreLabel.leftAnchor.constraint(equalTo: HangManView.leftAnchor, constant: 5),
			
			HintLabel.bottomAnchor.constraint(equalTo: HangManView.bottomAnchor, constant: -5),
			HintLabel.rightAnchor.constraint(equalTo: HangManView.rightAnchor, constant: -5),
			])
	}
	
	
	
	func loadLevel () {
		
		
		let word = Play.findWord(words: Play.wordArr)
		print("The word is: \(word)")
		Play.currentWord = word
		
		let userWord = Play.wordToEmty(str: word)
		WordLabel.text = userWord
		
		
		
	}
	
}
