import UIKit

//indexing thorugh a string

let name = "Taylor"

let letter = name[name.index(name.startIndex, offsetBy: 3)]

extension String {
	subscript(i: Int) -> String {
		return String(self[index(startIndex, offsetBy: i)])
	}
}

let l = name[2]
