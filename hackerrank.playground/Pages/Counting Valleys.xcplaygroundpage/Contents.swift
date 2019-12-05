//: [Previous](@previous)

import Foundation

func countingValleys(n: Int, s: String) -> Int {
    let sArr = Array(s)
    var location = 0
    var valleysCount = 0

    for item in sArr {
        if item == "D" {
            location -= 1
        }else if item == "U" {
            location += 1
            if location == 0 {
                valleysCount += 1
            }
        }
    }
    return valleysCount
}


print("\(countingValleys(n: 8, s: "UDDDUDUU"))")

//: [Next](@next)
