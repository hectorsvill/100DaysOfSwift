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
//	var savedUsedWords = [String]()
	
	

	override func viewDidLoad() {
		super.viewDidLoad()

		//create left side button to restart game
		navigationItem.leftBarButtonItem =
			UIBarButtonItem(barButtonSystemItem: .refresh,
							target: self, action: #selector(restartGame))

		//creating right side button
		navigationItem.rightBarButtonItem =
			UIBarButtonItem(barButtonSystemItem: .add,
							target: self, action: #selector(promptForAnswer))


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
		
		let defaults = UserDefaults()
		let savedWords = defaults.object(forKey: "usedWords") as? [String] ?? [String]()
		usedWords = savedWords
		

	}

	

	//tableview////////////////////////////////////////////////////////////////////
	
	override func tableView(_ tableView: UITableView,
							numberOfRowsInSection section: Int) -> Int {
		return usedWords.count
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Word", for: indexPath)
		cell.textLabel?.text = usedWords[indexPath.row]
		return cell
	}

	//@objc //////////////////////////////////////////////////////////////////

	@objc func promptForAnswer(){
		let ac = UIAlertController(title: "Enter Answer", message: nil, preferredStyle: .alert)
		ac.addTextField()
	
		let submitAction = UIAlertAction(title: "Submit", style: .default) {
			[weak self, weak ac] action in
			guard let answer = ac?.textFields?[0].text else { return }
			self?.submit(answer)
		}
	
		ac.addAction(submitAction)
		present(ac, animated: true)
	}

	@objc func restartGame(){
		startGame()
	}

	//func() //////////////////////////////////////////////////////////////////

	func submit(_ answer: String){
		let lowerAnswer = answer.lowercased()

		if isPossible(word: lowerAnswer) {
			if isOriginal(word: lowerAnswer) {
				if isReal(word: lowerAnswer) {

					usedWords.insert(answer, at: 0)
					save()
					let indexPath = IndexPath(row: 0, section: 0)
					tableView.insertRows(at: [indexPath], with: .automatic)

					return
				} else {
				notPossibleOriginalReal(errorTile: "Word not recognised", errorMessage: "Word is invalid!")
				}
			} else {
			notPossibleOriginalReal(errorTile: "Word used already", errorMessage: "Only use a word ones!")
				
			}
		}else {
		notPossibleOriginalReal(errorTile: "Not Possible", errorMessage: "You cant spell that word from \(title!)")
			
		}
	}

	func isPossible(word: String) -> Bool {
		guard var tempWord = title?.lowercased() else { return false}

		for letter in word {
			if let position = tempWord.firstIndex(of: letter) {
				tempWord.remove(at: position)
			} else {
				return false
			}
		}

		return true
	}

	func isOriginal(word: String) -> Bool {
		return !usedWords.contains(word)
	}

	func isReal(word: String) -> Bool {
		//check if word exist with uitectchecker
		let checker = UITextChecker()
		let range = NSRange(location: 0, length: word.utf16.count)
		let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
		return (misspelledRange.location == NSNotFound) && !(word.count < 3)
	}
	
	func notPossibleOriginalReal(errorTile: String, errorMessage: String){
		let ac = UIAlertController(title: errorTile, message: errorMessage, preferredStyle: .alert)
		ac.addAction(UIAlertAction(title: "OK", style: .default))
		present(ac, animated: true)
	}
	
	func startGame() {
		title = allWords.randomElement()
		//usedWords.removeAll(keepingCapacity: true)
		tableView.reloadData()
	}

	func save() {
		let defaults = UserDefaults.standard
		defaults.set(usedWords, forKey: "usedWords")
	}

}

