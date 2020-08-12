//: [Previous](@previous)

import Foundation
import XCTest

/*
 Given the array nums consisting of 2n elements in the form [x1,x2,...,xn,y1,y2,...,yn].
 Return the array in the form [x1,y1,x2,y2,...,xn,yn].
 
 
 */

func shuffle(_ nums: [Int], _ n: Int) -> [Int] {
    var newArray = [Int]()
    var left = [Int]()
    var right = [Int]()
    
    for i in 0..<nums.count {
        left.append(nums[i])
        
        if i >= n {
            right.append(nums[i])
        }
    }
    
    var x = 0
    var y = 0
    
    for i in 0..<nums.count {
        if i % 2 == 0 {
            newArray.append(left[x])
            x += 1
        } else {
            newArray.append(right[y])
            y += 1
        }
    }
    
    return newArray
}

XCTAssertEqual(shuffle([2,5,1,3,4,7], 3), [2,3,5,4,1,7])
XCTAssertEqual(shuffle([1,2,3,4,4,3,2,1], 4), [1,4,2,3,3,2,4,1])
XCTAssertEqual(shuffle([1,1,2,2], 2), [1,2,1,2])

//: [Next](@next)
