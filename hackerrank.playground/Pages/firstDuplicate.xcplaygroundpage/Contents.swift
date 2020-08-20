//: [Previous](@previous)

import Foundation
import XCTest
/*
 
 Given an array a that contains only numbers in the range from 1 to a.length,
 find the first duplicate number for which the second occurrence has the minimal index.
 In other words, if there are more than 1 duplicated numbers, return the number for
 which the second occurrence has a smaller index than the second occurrence of the
 other number does. If there are no such elements, return -1.
 
 */

func firstDuplicate(a: [Int]) -> Int {
    var numsDict = [Int: [Int]]()
    var firstDuplicate = -1
    
    for i in 0..<a.count {
        numsDict[a[i], default: []].append(i)
    }
    
    for num in a {
        let indexArray = numsDict[num]!
        
        if firstDuplicate == -1 && indexArray.count > 1{
            firstDuplicate = num
        } else if indexArray.count > 1 && indexArray[1] < numsDict[firstDuplicate]![1]  {
          firstDuplicate = num
        }
    }
    
    return firstDuplicate
}

XCTAssertEqual(firstDuplicate(a: [2, 1, 3, 5, 3, 2]), 3)
XCTAssertEqual(firstDuplicate(a: [2, 2]), 2)
XCTAssertEqual(firstDuplicate(a: [2, 4, 3, 5, 1]), -1)


//: [Next](@next)
