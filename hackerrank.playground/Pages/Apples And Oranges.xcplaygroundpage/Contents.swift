//: [Previous](@previous)

import Foundation

func countApplesAndOranges(s: Int, t: Int, a: Int, b: Int, apples: [Int], oranges: [Int]) -> Void {
    let appleLocation = apples.map { $0 + a }.filter { $0 >= s && $0 <= t }
    print(appleLocation.count)
    let orangesLoaction = oranges.map { $0 + b }.filter { $0 >= s && $0 <= t }
    print(orangesLoaction.count)
}

countApplesAndOranges(s: 7, t: 11, a: 5, b: 15, apples: [-2, 2, 1], oranges: [5, -6]) // 1 1

//: [Next](@next)
