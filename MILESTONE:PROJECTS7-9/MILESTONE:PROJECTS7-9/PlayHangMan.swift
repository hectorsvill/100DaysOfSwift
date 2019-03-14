//
//  PlayHangMan.swift
//  MILESTONE:PROJECTS7-9
//
//  Created by Hector Steven on 3/13/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import Foundation

struct PlayHangMan {
	var wordArr = [String]()

	func findWord(words: [String]) -> String {
		let word = words.randomElement()!
		return word
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
	
	
	
}
