//: [Previous](@previous)

import Foundation
import XCTest
/*
 https://leetcode.com/problems/reverse-integer/
 
 Given a 32-bit signed integer, reverse digits of an integer.
 Hint: 32-bit signed integer range: [−2^31,  2^31 − 1].

 */

extension Int {
    public static var min32Bit: Int {
        NSDecimalNumber(decimal: (pow(2, 31) * -1)).intValue
    }
    
    public static var max32Bit: Int {
        NSDecimalNumber(decimal: (pow(2, 31) - 1)).intValue
    }
}

func reverse(_ x: Int) -> Int {
    var number = x
    var reverseNumber = 0
    
    if x < 0 {
        number *= -1
    }
 
    while number > 0 {
        let a = number % 10
        reverseNumber = reverseNumber * 10 + a
        number /= 10
    }
    
    if reverseNumber < Int.min32Bit || reverseNumber > Int.max32Bit {
        return 0
    } else if x <  0 {
        reverseNumber *= -1
    }
    
    return reverseNumber
}

XCTAssertEqual(reverse(-56789), -98765)
XCTAssertEqual(reverse(123), 321)
XCTAssertEqual(reverse(12300), 321)
XCTAssertEqual(reverse(1534236469), 0)

//: [Next](@next)

