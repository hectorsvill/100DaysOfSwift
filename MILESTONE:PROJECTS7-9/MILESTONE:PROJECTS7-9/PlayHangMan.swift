//
//  PlayHangMan.swift
//  MILESTONE:PROJECTS7-9
//
//  Created by Hector Steven on 3/13/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import Foundation

struct PlayHangMan {
	var charsUsed = [Character]()
	var numberOfFailedTries = 0	// set to zero at start of game in loadlevel()
	var wordArr = [String]()
	var currentWord = ""		// set in loadlevel()
	var currentLabelWord = ""	// set in wordToEmpy

	func findWord(words: [String]) -> String {
		if let word = words.randomElement() {
			return word
		}
		return "Error"
	}
	
	mutating func wordToEmty(str: String) -> String {
		var newstr = ""
		for _ in 0..<str.count {
			newstr += "_"
			newstr += " "
		}
		currentLabelWord = newstr
		return newstr
	}
	
	func drawHM () -> String {
		var manstr = [String]()
		manstr.append("----o   \n")			// 0 / 7 points lost
		manstr.append("         |   \n")	// 1 / 7 Points lost
		manstr.append("         0   \n")	// 2 / 7 Points lost
		manstr.append("         |   \n")	// 3 / 7 Points lost
		manstr.append("            | - \n")	// 4 / 7 Points lost
		manstr.append("         - | - \n")	// 5 / 7 Points lost
		manstr.append("            \\ \n")	// 6 / 7 Points lost
		manstr.append("         / \\ \n")	// 7 / 7 Points lost  - Game lost

		var drawman = ""
		if numberOfFailedTries == 0 {
			drawman = manstr[0]
		} else if numberOfFailedTries == 1 {
			drawman += manstr[0]
			drawman += manstr[1]
		}else if numberOfFailedTries == 2 {
			drawman += manstr[0]
			drawman += manstr[1]
			drawman += manstr[2]
		}else if numberOfFailedTries == 3 {
			drawman += manstr[0]
			drawman += manstr[1]
			drawman += manstr[2]
			drawman += manstr[3]
		}else if numberOfFailedTries == 4 {
			drawman += manstr[0]
			drawman += manstr[1]
			drawman += manstr[2]
			drawman += manstr[4]
		} else if numberOfFailedTries == 5 {
			drawman += manstr[0]
			drawman += manstr[1]
			drawman += manstr[2]
			drawman += manstr[5]
			
		}else if numberOfFailedTries == 6 {
			drawman += manstr[0]
			drawman += manstr[1]
			drawman += manstr[2]
			drawman += manstr[5]
			drawman += manstr[6]
			
		}else if numberOfFailedTries == 7 {
			drawman += manstr[0]
			drawman += manstr[1]
			drawman += manstr[2]
			drawman += manstr[5]
			drawman += manstr[7]
		}
		return drawman
	}

	mutating func playThisChar(char: Character) -> Bool{
		if !currentWord.contains(char) {
			numberOfFailedTries += 1
			return false
		}
		print("Found [ \(char) ] in \(currentWord)")
		return true
	}

	mutating func resetWordLabel(char: Character) -> String {
		
		var newLabel = Array(currentLabelWord)

		var index = 0
		for c in currentWord{
			if c == char {
				newLabel[index * 2] = char
			}
			index += 1
		}

		currentWord = currentWord.replacingOccurrences(of: String(char), with: " ")
		let newstr = arrToStr(arr: newLabel)
		currentLabelWord = newstr
		print(newstr)
		print(currentWord)
		return newstr
	}
	
	func arrToStr(arr: [Character]) -> String{
		var str = ""
		for a in arr {
			str += String(a)
		}
		return str
	}
}
