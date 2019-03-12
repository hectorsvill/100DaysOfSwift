//
//  Calc.swift
//  SimpleCalculator
//
//  Created by Hector Steven on 3/11/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import Foundation
import UIKit

class Calc {
	var term1 = [Int]()
	var term2 = [Int]()
	var operate = [Any]()
	
	
	
	
	func add(term1: Int, term2: Int) -> Int {
		return term1 + term2
	}
	func subtract(term1: Int, term2: Int) -> Int {
		return term1 - term2
	}
	func multiply(term1: Int, term2: Int) -> Int {
		return term1 * term2
	}
	
	func divide(term1: Int, term2: Int) -> Int {
		return term1 / term2
	}
	
	func calcButtonText(index: Int) -> String {
		/*
			 0  1  2  3
			 4  5  6  7
			 8  9 10 11
			12 13 14 15
		
		*/
		let str: String
		if index == 0 { str = "7" }
		else if index == 1 { str = "8" }
		else if index == 2 { str = "9" }
		else if index == 3 { str = "+" }
		else if index == 4 { str = "4" }
		else if index == 5 { str = "5" }
		else if index == 6 { str = "6" }
		else if index == 7 { str = "-" }
		else if index == 8 { str = "1" }
		else if index == 9 { str = "2" }
		else if index == 10 { str = "3" }
		else if index == 11 { str = "x" }
		else if index == 12 { str = "C" }
		else if index == 13 { str = "0" }
		else if index == 14 { str = "=" }
		else if index == 15 { str = "/" }
		else { str = "_"}

		return str
	}
	
	func intArrToStr(_ arr: [Int]) -> String {
		if arr.isEmpty { return "_" }

		var str = ""

		for n in arr {
			let num = String(n)
			str += num
			print(str)
		}

		return str
	}

	func strIsInt(_ str: String) -> Bool {

		if let _ = Int(str) { return true }

		return false
	}

}
