//: [Previous](@previous)

import Foundation
import XCTest

/*
 
 https://leetcode.com/problems/find-numbers-with-even-number-of-digits/
 Given an array nums of integers, return how many of them contain an even number of digits.
 
 */

func isEvenCount(_ number: Int) -> Bool {
    if number == 0 {
        return false
    }
    
    var number = number
    var count = 0
    
    while number > 0 {
        count += 1
        number /= 10
    }
    
    return count % 2 == 0 ? true : false
}

func findNumbers(_ nums: [Int]) -> Int {
    var count = 0
    
    nums.forEach {
        if isEvenCount($0) {
            count += 1
        }
    }
    
    return count
}

XCTAssertEqual(findNumbers([0, 12, 123, 1234, 12345, 123456]), 3)
XCTAssertEqual(findNumbers([0, 123, 12345,]), 0)
XCTAssertEqual(findNumbers([6, 12]), 1)

//: [Next](@next)
