//
//
////indexing thorugh a string
//
//
////Part1
////	let name = "Taylor"
////
////	let letter = name[name.index(name.startIndex, offsetBy: 3)]
////
////	extension String {
////		subscript(i: Int) -> String {
////			return String(self[index(startIndex, offsetBy: i)])
////		}
////	}
////
////	let l = name[2]
//
///*
//	First, there are methods for checking whether a string starts with or ends
//	with a substring: hasPrefix() and hasSuffix(). They look like this:
//*/
//
////let password = "123456789"
////password.hasPrefix("123")
////password.hasSuffix("789")
//
//// self == current string
//
//extension String {
//	func deletingPrefix(_ prefix: String) -> String{
//		guard self.hasPrefix(prefix) else { return self }
//		return String(self.dropFirst(prefix.count))
//	}
//
//	func deletingSufix(_ sufix: String) -> String {
//		guard self.hasSuffix(sufix) else  { return self }
//		return String(self.dropLast(sufix.count))
//	}
//}
//
////
////let str = "This is a str"
////let newstr = str.deletingSufix("str")
////print(newstr)
//
///*
//	We could add our own specialized capitalization that uppercases only
//	the first letter in our string:
//*/
//
//
//extension String {
//	var capitalizedFirst: String {
//		guard let firstLetter = self.first else { return "" }
//		return firstLetter.uppercased() + self.dropFirst()
//	}
//}
//
//let input = "Swift is like Objective-C without the C"
////input.first
////input.dropFirst()
////input.capitalizedFirst
//
//
//
//
//extension String {
//	func containsAny(of array: [String]) -> Bool {
//		for item in array {
//			if self.contains(item) {
//				return true
//			}
//		}
//		return false
//	}
//}
//
//
////we’re passing input.contains as the closure
////that contains(where:) should run
//
////let language = ["C", "C++", "Swift"]
////language.contains("Swift")
////language.contains(where: input.contains)
//
//
//
////Formatting strings with NSAttributedString
//
//
//

import UIKit
import Foundation


let string = "This is a test string"
let attributes: [NSAttributedString.Key: Any] = [
	.foregroundColor: UIColor.white,
	.backgroundColor: UIColor.red,
	.font: UIFont.boldSystemFont(ofSize: 36)
]


let attributedString = NSMutableAttributedString(string: string)

