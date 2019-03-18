//https://www.hackingwithswift.com/100/12
import UIKit


//optionals

//handling missing data
//var num: Int? = nil
//num = 42
//print(num)

//unwrapping optionals
//var name: String? = nil
//
//if let unwrapped = name {
//    print("\(unwrapped.count) letters")
//}else{
//    print("no name")
//}

//unwrapping with guard
//Using guard let lets you deal with problems at the start of your functions, then exit immediately.
//var number: String? = nil
//func greet(_ name: String?) {
//    guard let unwrapped = name else {
//        print("You didn't provide a name!")
//        return
//    }
//
//    print("Hello, \(unwrapped)!")
//}
//
//var str: String?
//str = "lol"
//greet(str)
//greet("one more")


//force unwrapping
//let str = "33"
////let num = Int(str) // optional int
//let num = Int(str)! // now optional int unwraped and converted to Int

//implicitly unwrapped optionals
//mplicitly unwrapped optionals are created by adding an exclamation mark after your type name
//let age: Int! = nil
//print(age)
//print(age == nil)

//nil coalescing
//func username(for id: Int) -> String? {
//    if id == 1 {
//        return "Taylor"
//    } else {
//      return nil
//    }
//}
//let user = username(for: 1) ?? "Anon"

//optional chaining
//let names = ["John", "Paul", "George", "Ringo"]
//let beatle = names.first?.uppercased()

//optional try
//enum PasswordError: Error {
//    case obvious
//}
//func checkPassword(_ password: String) throws -> Bool {
//    if password == "pass" {
//        throw PasswordError.obvious
//    }
//    return true
//}
//
//do {
//    try checkPassword("pass")
//    print("Good Password")
//} catch {
//    print("Too easy")
//}
//
//if let result = try? checkPassword("passq") {
//    print("Result was \(result)")
//} else {
//    print("D'oh.")
//}


//failable initializer
//let str = "5"
//let num = Int(str)
//struct Person {
//    var id: String
//
//    init?(id: String) {
//        if id.count == 8 {
//            self.id = id
//        } else {
//            return nil
//        }
//    }
//}
//let one = Person(id: "Oneoneoneon")

//typecasting

class Animal { }
class Fish: Animal { }
class Dog: Animal {
    func makeNoise() {
        print("woof!")
    }
}
let pets = [Fish(), Dog(), Fish(), Dog()]
for p in pets {
    if let dog = p as? Dog {
        dog.makeNoise()
    }
}
