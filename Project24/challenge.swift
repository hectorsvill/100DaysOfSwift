#!/usr/bin/swift
import Foundation


/*
	Create a String extension that adds a withPrefix() method.
	If the string already contains the prefix it should return
	itself; if it doesn’t contain the prefix, it should return
	itself with the prefix added. For
	example: "pet".withPrefix("car") should return “carpet”.A
*/

let str = "#SwiftLang"

extension String {
	func withPrefix(_ prefix: String) -> String {
		let check =  self.hasPrefix(prefix)
		if check {
			return self
		}
		print(check)
		return prefix + self
	}
}

//let test = str.withPrefix("I love ")
//print(test)


/*
Create a String extension that adds an isNumeric property
that returns true if the string holds any sort of number.
Tip: creating a Double from a String is a failable initializer.

*/

extension String {
	var isNumeric: Bool {
		for c in self {
			for i in 0...9 {
				if let n = Int(String(c)) {
					if n == i { return true }
				}
			}
		}
		return false
	}
}


let num = "This number  is no luck!"
print(num.isNumeric)








