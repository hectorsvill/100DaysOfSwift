//: [Previous](@previous)

import Foundation
import XCTest

/*
 
  Given the array nums consisting of 2n elements in the form [x1,x2,...,xn,y1,y2,...,yn].
 Return the array in the form [x1,y1,x2,y2,...,xn,yn].
 
 */

func shuffle(_ nums: [Int], _ n: Int) -> [Int] {
    var newArray = [Int]()
    
    for i in 0..<n {
        newArray.append(nums[i])
        newArray.append(nums[i + n])
    }
    
    return newArray
}

XCTAssertEqual(shuffle([2,5,1,3,4,7], 3), [2,3,5,4,1,7])
XCTAssertEqual(shuffle([1,2,3,4,4,3,2,1], 4), [1,4,2,3,3,2,4,1])
XCTAssertEqual(shuffle([1,1,2,2], 2), [1,2,1,2])

//: [Next](@next)
