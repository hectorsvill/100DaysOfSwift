//https://www.hackingwithswift.com/sixty/9/1/protocols
import UIKit

////protocols
//protocol Name {
//    var firstName: String { get set }
//}
//struct User: Name {
//    var firstName: String
//}
//
//func displayID(thing: Name) {
//    print("My name is \(thing.firstName)")
//}

//Protocol inheritence
//protocol Grade {
//    func getGrade () -> Double
//}
//protocol Name {
//    func getName() -> String
//}
//protocol isPassing {
//    func passin(pass: Int)
//}
//protocol Student: Grade, Name, isPassing {}

//extensions
//extension Int {
//    func squared() -> Int {
//        return self * self
//    }
//}
//extension Int {
//    var isOdd: Bool {
//        return self % 2 != 0
//    }
//}
//let number = 11
//print(number.squared())
//print(number.isOdd)

//protocol exntensions
//let names = ["ojkef", "fewfe","45rwf", "dfgs", "$RTEf"]
//
//extension Collection {
//    func showInfo () {
//        print("Count of arr: \(count)")
//        for collect in self {
//            print(collect)
//        }
//    }
//}
//names.showInfo()


//protocal-oriented programing
protocol getInfo {
    var id: String { get set }
    func show()
}
extension getInfo {
    func show() {
        print("Agent: \(id)34")
    }
}
struct Player: getInfo {
    var id: String
}
let stoicz = Player(id: "hvillasa")
//Player.show()
