//: [Previous](@previous)

import Foundation
import XCTest

/*
 
 https://leetcode.com/problems/running-sum-of-1d-array/
 
 Given an array nums.
 We define a running sum of an array as runningSum[i] = sum(nums[0]…nums[i]).
 Return the running sum of nums.
 
 */

func runningSum(_ nums: [Int]) -> [Int] {
    var newArray = [Int]()
    var lastValue = 0
    
    for i in 0..<nums.count {
        lastValue += nums[i]
        newArray.append(lastValue)
    }
    
    return newArray
}

XCTAssertEqual(runningSum([1,2,3,4]), [1,3,6,10])
XCTAssertEqual(runningSum([1,1,1,1,1]), [1,2,3,4,5])
XCTAssertEqual(runningSum([3,1,2,10,1]), [3,4,6,16,17])

//: [Next](@next)
