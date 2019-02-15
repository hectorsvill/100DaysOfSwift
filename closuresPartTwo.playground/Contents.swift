import UIKit

//closures part one review
//var printCopy = { (num: Int) in
//    switch num {
//    case 2:
//        print(2)
//    case 4:
//        print(4)
//    default:
//        print(num)
//    }
//}
//var printCopy = { (num: String) in
//    switch num {
//    case "Two":
//        print(2)
//    case "Four":
//        print(4)
//    default:
//        print(num)
//    }
//}
//
//
//printCopy(String(44))

//let convertNumerals = { (numeral: String) -> String in
//    switch numeral {
//    case "I":
//        return "1"
//    case "II":
//        return "2"
//    case "III":
//        return "3"
//    default:
//        return "343"
//    }
//}
//print(convertNumerals("II"))
//
//var buyMagazine = { (name: String) -> Int in
//    let amount = 10
//    print("\(name) costs \(amount)")
//    return amount
//}
//buyMagazine("Wired")

//let trick = {print("back180")}
//func doTricks(trick: () -> Void) {
//    print("Drone TrickS")
//    trick()
//
//}
//
//doTricks {print("One More!")}
//https://www.hackingwithswift.com/sixty/6/6/using-closures-as-parameters-when-they-accept-parameters

//CLOSURES WITH PARAMETERS

//Using Closures as parameters  when they accept parameters
//let trick = {(trick: String) -> Void in
//    print("The trick is \(trick)")
//}
////trick("back180")
func getTrick (trick: (String) -> Void){
    print("Thhe Trick is ")
    trick("180")
}

//// adding parameters to trailing closure syntax
//getTrick { (tri: String) in print("the trick is \(tri)") }

//using closures as parameters when they return values
func goTo(spot: (String) -> String) {
    let location = spot("*fly spot*")
    print("The type of location: \(location)")
}

    //Now when we call travel() using trailing closure syntax,
    //our closure code is required to accept a string and return a string

goTo{ (loc: String) -> String in
    return "1.Is a \(loc)"
}


//Shorthand parameter names
//or
goTo{ loc -> String in
    return "2.This is crazy magic \(loc)"
}
//or
//swift holds value for closure parameter in special character $0, $1 ...
goTo {
    return "3.shorthand parameter names \($0)"
}

//practice
func findSmallest(arr: [Int]) -> Int {
    var small = 0
    
    if (arr.isEmpty){
        return -1
    }else{
        small = arr[0]
        for n in arr {
            if n < small { small = n}
        }
    }
    
    return small
}

//print(type(of: nums))
//print(findSmallest(arr: [4, 345, 23, 6754, -1, -213, 100]))
//print(findSmallest(arr:[]))

//                      func-var: takes
func findANumberClosure (closure: (Int) -> Bool, arr: [Int]) -> [Int] {
    var newArr = [Int]()
    //loop through arr: Int array and check each num
    for a in arr {
            print(a)
            closure(a)
            newArr.append(a)
    }
    return newArr
}

//let smallestNum = findANumberClosure(closure: <#T##(Int) -> Bool#>, arr: <#T##[Int]#>)
//print(smallestNum)
