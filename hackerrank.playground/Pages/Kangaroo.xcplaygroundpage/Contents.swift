//: [Previous](@previous)

import Foundation

// 9/30 fail
//https://www.hackerrank.com/challenges/kangaroo/problem

func kangaroo(x1: Int, v1: Int, x2: Int, v2: Int) -> String {

    var position_x1 = x1
    var position_x2 = x2

    while (position_x1 <= 1000 || position_x2 <= 1000) {

        if (position_x1 == position_x2) {
            return "YES"
        }

        position_x1 += v1
        position_x2 += v2

    }
    
    if (position_x1 == position_x2) {
            return "YES"
    }

    return "NO"
}
