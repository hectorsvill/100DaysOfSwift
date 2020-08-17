//: [Previous](@previous)

import Foundation
import XCTest

/*
 
 Given the array nums, for each nums[i] find out how many numbers in
 the array are smaller than it. That is, for each nums[i] you have to
 count the number of valid j's such that j != i and nums[j] < nums[i].
 Return the answer in an array.
 
 */

func smallerNumbersThanCurrent(_ nums: [Int]) -> [Int] {
    var smallerNumbersArray = [Int]()
    
    for num in nums {
        var count = 0
        for n in nums {
            if num > n{
              count += 1
            }
        }
        
        smallerNumbersArray.append(count)
    }
    
    return smallerNumbersArray
}


XCTAssertEqual(smallerNumbersThanCurrent([8,1,2,2,3]), [4, 0, 1, 1, 3])
XCTAssertEqual(smallerNumbersThanCurrent([6,5,4,8]), [2,1,0,3])
XCTAssertEqual(smallerNumbersThanCurrent([1,1,1,1]), [0,0,0,0])


//: [Next](@next)
