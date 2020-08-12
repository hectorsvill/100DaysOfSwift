//: [Previous](@previous)

import Foundation
import XCTest

/*
 https://leetcode.com/problems/remove-duplicates-from-sorted-array/
 
 Given a sorted array nums, remove the duplicates in-place such that each element appear only once and return the new length.
 Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.
 
 */

func removeDuplicates(_ nums: inout [Int]) -> Int {
    var removeCount = 0
    var i = 0
    
    while i < nums.count - 1 {
        if nums[i] == nums[i + 1] {
            removeCount  += 1
            nums.remove(at: i + 1)
        } else {
            i += 1
        }
    }

    return removeCount
}

var arr1 = [1,1,2,2,3,3,3,3,3,4,5,5,5,6,6,7,7,7,8,8,9,9]
XCTAssertEqual(removeDuplicates(&arr1), 13)
XCTAssertEqual(arr1, [1, 2, 3, 4, 5, 6, 7, 8, 9])

var arr2 = [1,1,2,]
XCTAssertEqual(removeDuplicates(&arr2), 1)
XCTAssertEqual(arr2, [1, 2])

var arr3 = [1,2,2]
XCTAssertEqual(removeDuplicates(&arr3), 1)
XCTAssertEqual(arr3, [1, 2])

var arr4 = [1,1,1,1,]
XCTAssertEqual(removeDuplicates(&arr4), 3)
XCTAssertEqual(arr4, [1])






//: [Next](@next)
