//: [Previous](@previous)

import Foundation

// 9/30 fail
//https://www.hackerrank.com/challenges/kangaroo/problem

func kangaroo(x1: Int, v1: Int, x2: Int, v2: Int) -> String {

    var position_x1 = x1
    var position_x2 = x2

    while (position_x1 <= Int.max || position_x2 <= Int.max) {

        position_x1 += v1
        position_x2 += v2

        if (position_x1 == position_x2) {
            break
        }
    }

//    print("x1: \(position_x1 )\nx2: \(position_x2)")

    return (position_x1 == position_x2) ? "YES" : "NO"
}

//4523 8092 9419 8076 , yess

let x1 = 4523
let v1 = 8092
let x2 = 9419
let v2 = 8076

let resutl = kangaroo(x1: x1, v1: v1, x2: x2, v2: v2)

print(resutl)


