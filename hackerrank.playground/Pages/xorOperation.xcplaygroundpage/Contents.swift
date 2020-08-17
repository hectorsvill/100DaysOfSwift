//: [Previous](@previous)

import Foundation
import XCTest

/*
 
 Given an integer n and an integer start.
 Define an array nums where nums[i] = start + 2*i (0-indexed) and n == nums.length.
 Return the bitwise XOR of all elements of nums.
 
 */

func xorOperation(_ n: Int, _ start: Int) -> Int {
    var xorArray = [Int]()
    
    for index in 0..<n {
        xorArray.append(start + (index * 2))
    }
    
    return xorArray.reduce(0, ^)
}

XCTAssertEqual(xorOperation(5, 0), 8)
XCTAssertEqual(xorOperation(4, 3), 8)
XCTAssertEqual(xorOperation(1, 7), 7)
XCTAssertEqual(xorOperation(10, 5), 2)


//: [Next](@next)
