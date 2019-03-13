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
	var activatedButtons = [UIButton]()
	var solutions = [String]()

	var score = 0{
		didSet{
			scoreLabel.text = "Score: \(score)"
		}
	}
	
	var level = 1

	override func loadView() {
		view = UIView()
		view.backgroundColor = UIColor.lightGray

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
		submit.addTarget(self, action: #selector(submitTapped), for: .touchUpInside)
		view.addSubview(submit)

		let clear = UIButton(type: .system)
		clear.translatesAutoresizingMaskIntoConstraints = false
		clear.setTitle("CLEAR", for: .normal)
		clear.addTarget(self, action: #selector(clearTapped), for: .touchUpInside)
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

		let width = 150
		let height = 80

		for row in 0..<4{
			for col in 0..<5 {
				let letterButton = UIButton(type: .system)
				letterButton.titleLabel?.font = UIFont.systemFont(ofSize: 36)
				letterButton.setTitle("HHH", for: .normal)

				let frame = CGRect(x: col * width, y: row * height, width: width, height: height)
				letterButton.frame = frame
				letterButton.addTarget(self, action: #selector(letterTapped), for: .touchUpInside)
				buttonView.addSubview(letterButton)

				letterButtons.append(letterButton)
			}
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		performSelector(inBackground: #selector(loadLevel), with: nil)
	}

	@objc func letterTapped(_ sender: UIButton) {
		guard let buttonTitle = sender.titleLabel?.text else { return }
		currentAnswer.text = currentAnswer.text?.appending(buttonTitle)
		activatedButtons.append(sender)
		sender.isHidden = true
	}
	
	@objc func submitTapped(_ sender: UIButton) {
	
		guard let answerText = currentAnswer.text else { return }

		if let solutionPosition = solutions.index(of: answerText){
			activatedButtons.removeAll()

			var splitAnswers = answerLabel.text?.components(separatedBy: "\n")
			splitAnswers?[solutionPosition] = answerText
			answerLabel.text = splitAnswers?.joined(separator: "\n")

			currentAnswer.text = ""
			score += 1

			if score % 7 == 0 {
				let ac = UIAlertController(title: "Well done", message: "Ready for the next level?", preferredStyle: .alert)
				ac.addAction(UIAlertAction(title: "Lets Go!", style: .cancel, handler: levelup))
				present(ac, animated: true)
			}
		} else {
			if score > 0 { score -= 1 }
			let ac = UIAlertController(title: "Wrong!", message: nil, preferredStyle: .alert)
			ac.addAction(UIAlertAction(title: "OK", style: .cancel))
			present(ac, animated: true)
		}
	}

	@objc func clearTapped(_ sender: UIButton) {
		currentAnswer.text = ""
		for b in activatedButtons{
			b.isHidden = false
		}
		activatedButtons.removeAll()
	}

	@objc func loadLevel() {
		var clueString = ""
		var solutionString = ""
		var letterBits = [String]()

		if let levelFileURL = Bundle.main.url(forResource: "level\(level)", withExtension: "txt") {
			if let levelContents = try? String(contentsOf: levelFileURL) {
				var lines = levelContents.components(separatedBy: "\n")
				lines.shuffle()

				//error loading out of bound on clue
				for (index, l) in lines.enumerated() {
					if l.isEmpty {
						lines.remove(at: index)
					}
				}

				for (index, line) in lines.enumerated() {
					let parts = line.components(separatedBy: ": ")
					print(parts)
					
					let answer = parts[0]
					let clue = parts[1]

					clueString += "\(index + 1). \(clue)\n"

					let solutionWord = answer.replacingOccurrences(of: "|", with: "")
					solutionString += "\(solutionWord.count) letters\n"
					solutions.append(solutionWord)

					let bits = answer.components(separatedBy: "|")
					letterBits += bits
				}
			}
		}

		
		DispatchQueue.main.async {
			[weak self] in
			//configure buttons anf labels
			self?.cluesLabel.text = clueString.trimmingCharacters(in: .whitespacesAndNewlines)
			self?.answerLabel.text = solutionString.trimmingCharacters(in: .whitespacesAndNewlines)
			letterBits.shuffle()
			
			let count = self?.letterButtons.count
			if letterBits.count == count {
				for i in 0 ..< count! {
					self?.letterButtons[i].setTitle(letterBits[i], for: .normal)
				}
			}
		}

	}

	func levelup (action: UIAlertAction) {
//		level += 1
		solutions.removeAll(keepingCapacity: true)
		loadLevel()
		for b in letterButtons {
			b.isHidden = false
		}
	}

}

