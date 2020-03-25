//: [Previous](@previous)

import Foundation
// Mark: - arrayManipulation

let n = 10
var test = [[1, 2, 100], [2, 5, 100], [3, 4, 100]]

test = [[2,6,8], [3,5,7], [1,8,1], [5, 9, 15]]


func arrayManipulation(n: Int, queries: [[Int]]) -> Int {
    var storage = Array(repeating: 0, count: n)
    var big = 0

    for i in 0..<queries.count {
        let query = queries[i]
        let bottom = query[0] - 1
        let top = query[1] - 1
        let addedValue = query[2]

        for i in bottom...top {
            storage[i] += addedValue

            if storage[i] > big {
                big = storage[i]
            }
        }
//        print(storage)
    }

    return big
}


arrayManipulation(n: n, queries: test)
