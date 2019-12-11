//: [Previous](@previous)

import Foundation

//https://www.hackerrank.com/challenges/equality-in-a-array/problem

func equalizeArray(arr: [Int]) -> Int {
    
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

    let deletetions = d.values.reduce(0, +)

    return deletetions
}

//: [Next](@next)
