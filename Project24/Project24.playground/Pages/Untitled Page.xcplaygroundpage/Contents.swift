import UIKit

//indexing thorugh a string


//Part1
//	let name = "Taylor"
//
//	let letter = name[name.index(name.startIndex, offsetBy: 3)]
//
//	extension String {
//		subscript(i: Int) -> String {
//			return String(self[index(startIndex, offsetBy: i)])
//		}
//	}
//
//	let l = name[2]

/*
	First, there are methods for checking whether a string starts with or ends
	with a substring: hasPrefix() and hasSuffix(). They look like this:
*/

let password = "123456789"
password.hasPrefix("123")
password.hasSuffix("789")
// self == current string
extension String {
	func deletingPrefix(_ prefix: String) -> String{
		guard self.hasPrefix(prefix) else { return self }
		return String(self.dropFirst(prefix.count))
	}
	
	func deletingSufix(_ sufix: String) -> String {
		guard self.hasSuffix(sufix) else  { return self }
		return String(self.dropLast(sufix.count))
	}
}


let str = "This is a str"
let newstr = str.deletingSufix("str")
print(newstr)
