#!/usr/bin/swift
import Foundation


/*
	Create a String extension that adds a withPrefix() method.
	If the string already contains the prefix it should return
	itself; if it doesn’t contain the prefix, it should return
	itself with the prefix added. For/Users/hectorsteven/dev/100DaysOfSwift/Project24/Project24.swift
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

let test = str.withPrefix("I love ")
print(test)













