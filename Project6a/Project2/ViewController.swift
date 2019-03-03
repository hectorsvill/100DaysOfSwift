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
	
	var countries = [String]()
	var score = 0
	var correctAnswer = 0
	var numberOfCuestionsAsked = 1
	
	override func viewDidLoad()
	{
		super.viewDidLoad()
	
		let label1 = UILabel()
		label1.translatesAutoresizingMaskIntoConstraints = false
		label1.backgroundColor = UIColor.red
		label1.text = "These"
		label1.sizeToFit()
		
		let label2 = UILabel()
		label2.translatesAutoresizingMaskIntoConstraints = false
		label2.backgroundColor = UIColor.cyan
		label2.text = "ARE"
		label2.sizeToFit()
		
		let label3 = UILabel()
		label3.translatesAutoresizingMaskIntoConstraints = false
		label3.backgroundColor = UIColor.yellow
		label3.text = "SOME"
		label3.sizeToFit()
		
		let label4 = UILabel()
		label4.translatesAutoresizingMaskIntoConstraints = false
		label4.backgroundColor = UIColor.green
		label4.sizeToFit()
		
		let label5 = UILabel()
		label5.translatesAutoresizingMaskIntoConstraints = false
		label5.backgroundColor = UIColor.orange
		label5.sizeToFit()
		
		view.addSubview(label1)
		view.addSubview(label2)
		view.addSubview(label3)
		view.addSubview(label4)
		view.addSubview(label5)
		
		countries += ["estonia", "france", "germany", "ireland",
					"italy", "monaco", "nigeria", "poland",
					"russia", "spain", "uk", "us"]
        
		button1.layer.borderWidth = 1
		button2.layer.borderWidth = 1
		button3.layer.borderWidth = 1

		button1.layer.borderColor = UIColor.lightGray.cgColor
		button2.layer.borderColor = UIColor.lightGray.cgColor
		button3.layer.borderColor = UIColor.lightGray.cgColor

		askQuestion()
    }

	func askQuestion(action: UIAlertAction! = nil)
	{
		countries.shuffle()
		correctAnswer = Int.random(in: 0...2)

		button1.setImage(UIImage(named: countries[0]), for: .normal)
		button2.setImage(UIImage(named: countries[1]), for: .normal)
		button3.setImage(UIImage(named: countries[2]), for: .normal)
		
		//set title to navigation bar
		title = "Find: \(countries[correctAnswer].uppercased())\t\t#\(numberOfCuestionsAsked)"

		numberOfCuestionsAsked += 1
		
		//right bar button setup
		navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
		
		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(checkScore))
	}

	//IBAction connected to 3 buttons with tag 0,1,2
	@IBAction func buttonTapped(_ sender: UIButton)
	{
		var title: String
		var ac: UIAlertController
	
		if sender.tag == correctAnswer
		{
			title = "Correct!"
			score += 1
		}
		else
		{
			title = "Wrong!"
			//score -= 1
		}

		//10 round game. 9th round is the last
		if numberOfCuestionsAsked == 10
		{
			ac = UIAlertController( title: "Final Score", message: "You scored: \(numberOfCuestionsAsked) / 10", preferredStyle: .actionSheet)
			score = 0
			numberOfCuestionsAsked = 1
			
		}
		else
		{
			ac = UIAlertController(title: title, message: "The answer is \(countries[correctAnswer])!", preferredStyle: .alert)
		}
	
		ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
		present(ac, animated: true)
	}
	
	@objc func shareTapped()
	{
		let vc = UIActivityViewController(activityItems: ["I Scored \(score) in the Flag Game!"], applicationActivities: [])
		vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
		present(vc, animated: true)
		
	}
	
	@objc func checkScore()
	{
		let ac = UIAlertController(title: "score:\(score) / 10 \t Game Rules:", message: "Choose correct flag and score a point!", preferredStyle: .actionSheet)
		ac.addAction(UIAlertAction(title: "Continue .. ", style: .default, handler: nil))
		present(ac, animated: true)
	
	}


}

