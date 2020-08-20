//: [Previous](@previous)

import Foundation
import XCTest

/*
 
 Given an array of integers arr, and three integers a, b and c.
 You need to find the number of good triplets.
 A triplet (arr[i], arr[j], arr[k]) is good if the following conditions are true:

 0 <= i < j < k < arr.length
 |arr[i] - arr[j]| <= a
 |arr[j] - arr[k]| <= b
 |arr[i] - arr[k]| <= c
 Where |x| denotes the absolute value of x.

 Return the number of good triplets.
 
 */

func countGoodTriplets(_ arr: [Int], _ a: Int, _ b: Int, _ c: Int) -> Int {
    var goodTripletsCount = 0
    
    for i in 0..<arr.count - 2{
        for j in i + 1..<arr.count - 1{
            for k in j + 1..<arr.count {
                let numI = arr[i]
                let numJ = arr[j]
                let numK = arr[k]
                
                if abs(numI - numJ) <= a && abs(numJ - numK) <= b && abs(numI - numK) <= c {
                    goodTripletsCount += 1
                }
            }
        }
    }
    
    return goodTripletsCount
}

XCTAssertEqual(countGoodTriplets([3,0,1,1,9,7], 7, 2, 3), 4)
XCTAssertEqual(countGoodTriplets([1,1,2,2,3], 0, 0, 1), 0)
