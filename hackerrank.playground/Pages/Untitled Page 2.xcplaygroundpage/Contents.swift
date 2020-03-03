//: [Previous](@previous)

import Foundation


func matchingStrings(strings: [String], queries: [String]) -> [Int] {
    var matchCount = [Int]()

    queries.forEach {
        var count = 0

        for s in strings {
            if s == $0 {
                count += 1
            }
        }

        matchCount.append(count)
    }

    return matchCount
}

let input = ["aba", "baba", "aba", "xzxb"]
let query = ["aba", "xzxb", "ab"]

matchingStrings(strings: input, queries: query)
