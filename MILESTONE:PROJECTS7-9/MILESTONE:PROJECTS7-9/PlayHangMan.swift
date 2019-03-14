//
//  PlayHangMan.swift
//  MILESTONE:PROJECTS7-9
//
//  Created by Hector Steven on 3/13/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import Foundation

struct PlayHangMan {
	var numberOfFailedTries = 7
	var wordArr = [String]()

	func findWord(words: [String]) -> String {
		if let word = words.randomElement() {
			return word
		}
		return "Strong"
	}
	
	func createEmptyStrArray (str: String) -> String {
		var arr = [Character]()
		var str = ""
		for _ in 0..<str.count {
			arr.append("_")
			arr.append(" ")
		}
		
		for a in arr {
			str.append(String(a))
		}
		return str
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
		manstr.append("          / \\ \n")	// 7 / 7 Points lost  - Game lost
		
		var drawman = ""
		if numberOfFailedTries == 0 {
			drawman = manstr[0]
			print(drawman)
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
}
