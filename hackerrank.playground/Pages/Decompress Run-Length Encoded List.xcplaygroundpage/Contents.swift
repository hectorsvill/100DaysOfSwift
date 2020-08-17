//: [Previous](@previous)

import Foundation
import XCTest

/*
 
 We are given a list nums of integers representing a list compressed with run-length encoding.
 
 Consider each adjacent pair of elements [freq, val] = [nums[2*i], nums[2*i+1]] (with i >= 0).
 For each such pair, there are freq elements with value val concatenated in a sublist.
 Concatenate all the sublists from left to right to generate the decompressed list.
 
 Return the decompressed list.
 
 */


func decompressRLElist(_ nums: [Int]) -> [Int] {
    var decompressedList = [Int]()
    var index = 0
    
    while index < nums.count {
        let freq = nums[index]
        let val = nums[index + 1]
        
        decompressedList.append(contentsOf: Array(repeating: val, count: freq))
        
        index += 2
    }
    
    return decompressedList
}

let testCases = [
    [[1,2,3,4], [2,4,4,4]],
    [[1,1,2,3], [1,3,3]],
]

for index in 0..<testCases.count {
    XCTAssertEqual(decompressRLElist(testCases[index][0]), testCases[index][1])
}


//: [Next](@next)
