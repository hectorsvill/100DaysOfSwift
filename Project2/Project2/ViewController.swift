//
//  ViewController.swift
//  Project2
//
//  Created by Hector Steven on 2/21/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet var button1: UIButton!
	@IBOutlet var button2: UIButton!
	@IBOutlet var button3: UIButton!
	@IBOutlet var scoreLabel: UILabel!
	@IBOutlet var bestScoreLabel: UILabel!
	
	
	var bestScore = 0 {
		didSet {
			bestScoreLabel.text = "BestScore: \(bestScore)/10"
		}
	}
	
	
	var countries = [String]()
	var score = 0 {
		didSet {
			scoreLabel.text = "Score: \(score)/10"
		}
	}
	
	
	var correctAnswer = 0
	var numberOfCuestionsAsked = 1
	
	override func viewDidLoad() {
		super.viewDidLoad()
	
		countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
		button1.layer.borderWidth = 1
		button2.layer.borderWidth = 1
		button3.layer.borderWidth = 1

		button1.layer.borderColor = UIColor.lightGray.cgColor
		button2.layer.borderColor = UIColor.lightGray.cgColor
		button3.layer.borderColor = UIColor.lightGray.cgColor

		askQuestion()
		
		let dedaults = UserDefaults()
		if let savedBestScore = dedaults.object(forKey: "bestScore") as? Int {
			bestScore = savedBestScore
		}
	}

	func askQuestion(action: UIAlertAction! = nil) {
		countries.shuffle()
		correctAnswer = Int.random(in: 0...2)

		button1.setImage(UIImage(named: countries[0]), for: .normal)
		button2.setImage(UIImage(named: countries[1]), for: .normal)
		button3.setImage(UIImage(named: countries[2]), for: .normal)
		
		title = "\(numberOfCuestionsAsked).Find: \(countries[correctAnswer].uppercased())" //"\t\t#\(numberOfCuestionsAsked)"
		numberOfCuestionsAsked += 1
		navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(checkScore))
	}

	//IBAction connected to 3 buttons with tag 0,1,2
	@IBAction func buttonTapped(_ sender: UIButton) {
		var title: String
		var ac: UIAlertController
	
		
		animateSender(sender)
		
		if sender.tag == correctAnswer{
			title = "Correct!"
			score += 1
		} else {
			title = "Wrong!"
			//score -= 1
		}

		//10 round game. 9th round is the last
		if numberOfCuestionsAsked == 11 {
			if score > bestScore {
				bestScore = score
				save()
			}
	
			ac = UIAlertController( title: "Final Score", message: "You scored: \(score) / 10", preferredStyle: .actionSheet)
			score = 0
			numberOfCuestionsAsked = 1
			
		} else {
			ac = UIAlertController(title: title, message: "The answer is \(countries[correctAnswer])!", preferredStyle: .actionSheet)
		}
	
		ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
		present(ac, animated: true)
	}
	
	@objc func shareTapped() {
		let vc = UIActivityViewController(activityItems: ["I Scored \(score) in the Flag Game!"], applicationActivities: [])
		vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
		present(vc, animated: true)
	}
	
	@objc func checkScore(){
		let ac = UIAlertController(title: "score:\(score) / 10 \t Game Rules:", message: "Choose correct flag and score a point!", preferredStyle: .actionSheet)
		ac.addAction(UIAlertAction(title: "Continue .. ", style: .default, handler: nil))
		present(ac, animated: true)
	
	}
	
	func save() {
		let defaults = UserDefaults.standard
		defaults.set(bestScore, forKey: "bestScore")
	}
	
	func animateSender(_ sender: UIButton) {
		UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 5, options: [], animations: {
			sender.transform = CGAffineTransform(scaleX: 2, y: 2)
			sender.transform = CGAffineTransform(translationX: 0, y: 20)
			
		}){ finished in
			sender.transform = .identity
		}
	}
}

