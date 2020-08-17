//: [Previous](@previous)

import Foundation
import XCTest

/*
 
 Given an array of integers nums.
 A pair (i,j) is called good if nums[i] == nums[j] and i < j.
 Return the number of good pairs.
 
 Input: nums = [1,2,3,1,1,3]
 Output: 4
 
 There are 4 good pairs (0,3), (0,4), (3,4), (2,5) 0-indexed.

 */


func numIdenticalPairs(_ nums: [Int]) -> Int {
    var numberOfPairs = 0
    var numsDict = [Int: [Int]]()
    
    for (index, num) in nums.enumerated() {
        numsDict[num, default: []].append(index)
    }
    
    for item in numsDict {
        let indexArray = item.value
        
        if indexArray.count > 1 {
            for x in 0..<indexArray.count {
                for _ in x + 1..<indexArray.count  {
                    numberOfPairs += 1
                }
            }
        }
    }
    
    return numberOfPairs
}

XCTAssertEqual(numIdenticalPairs([1,2,3,1,1,3]), 4)
XCTAssertEqual(numIdenticalPairs([1,1,1,1]), 6)
XCTAssertEqual(numIdenticalPairs([1,2,3]), 0)


//: [Next](@next)
