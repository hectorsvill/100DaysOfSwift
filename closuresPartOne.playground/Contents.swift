//https://www.hackingwithswift.com/sixty/6/6/using-closures-as-parameters-when-they-accept-parameters
//closure part one

import UIKit

//creating basic closures
//let whoIs = {
//    print("Iamwho")
//}
//whoIs()

//Accepting parameters in a closure
//let whoIS = { (name: String) in
//    print("The name \(name)")
//}
//whoIS("Iam")

//Returning Values From A Closure
//let map = { (loc: Int) -> String in
//    return "loc : \(loc)"
//}
//print(map(23))

//closures as parameters in functions
//let secretNumber = {
//    print("@#^")
//}
//func getSecret (num: () -> Void, x: Int) {
//    print("...... .. . .", "\n@&*@&*#&")
//    num()
//    print("\(x)")
//}
//getSecret(num: secretNumber, x: 1010)

//TRAILING CLOSURE SYNTAX
let sec = {
    print("onme")
}

func getSecret (sec: () -> Void) {
    let x = 123
    print("\(x*111)")
    sec()
}
getSecret {
    sec()
    print("one")
}

