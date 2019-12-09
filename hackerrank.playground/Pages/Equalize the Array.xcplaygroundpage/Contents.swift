//: [Previous](@previous)

import Foundation

func equalizeArray(arr: [Int]) -> Int {
    var max = 0
    var d: [Int: Int] = [:]

    _ = arr.map {
        d[$0, default: 0] += 1
    }

    var max_key = d.values.max()!

    for (k, v) in d {
        if max_key == v {
            max_key = Int(k)
        }
    }

    d.removeValue(forKey: max_key)

    var deletetions = d.values.reduce(0, +)

    return deletetions
}

//: [Next](@next)
