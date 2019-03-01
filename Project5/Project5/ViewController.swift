//
//  ViewController.swift
//  Project5
//
//  Created by Hector Steven on 2/28/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

	var allWords = [String]()
	var usedWords = [String]()

	override func viewDidLoad() {
		super.viewDidLoad()

		//creating right side button
		navigationItem.rightBarButtonItem =
			UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(promptForAnswer))


		//Reading File from Disk
		if let startWordsURL = Bundle.main.url(forResource: "start",
											   withExtension: "txt"){
			if let startWords = try? String(contentsOf: startWordsURL) {
				allWords = startWords.components(separatedBy: "\n")
			}
		}

		if allWords.isEmpty {
			allWords = ["Empty"]
		}

		startGame()

	}

	func startGame() {
		title = allWords.randomElement()
		usedWords.removeAll(keepingCapacity: true)
		tableView.reloadData()
	}
	
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return usedWords.count
	}

	override func tableView(_ tableView: UITableView,
							cellForRowAt indexPath: IndexPath)
							 -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "Word",
												 for: indexPath)

		cell.textLabel?.text = usedWords[indexPath.row]

		return cell
	}
	
	@objc func promptForAnswer(){

		let ac = UIAlertController(title: "Enter Answer", message: nil,
								   preferredStyle: .alert)

		ac.addTextField()

		let submitAction = UIAlertAction(title: "Submit", style: .default) {

			[weak self, weak ac] action in
			guard let answer = ac?.textFields?[0].text else { return }
			self?.submit(answer)

		}

		ac.addAction(submitAction)
		present(ac, animated: true)
	}

	func submit(_ answer: String){
		let lowerAnswer = answer.lowercased()

		if isPossible(word: lowerAnswer) {
			if isOriginal(word: lowerAnswer) {
				if isReal(word: lowerAnswer) {
					usedWords.insert(answer, at: 0)

					let indexPath = IndexPath(row: 0, section: 0)
					tableView.insertRows(at: [indexPath], with: .automatic)
				}
			}
		}
	}

	func isPossible(word: String) -> Bool {
		return true
	}

	func isOriginal(word: String) -> Bool {
		return true
	}

	func isReal(word: String) -> Bool {
		return true
	}
}

