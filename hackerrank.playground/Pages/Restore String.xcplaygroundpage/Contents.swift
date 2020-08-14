//: [Previous](@previous)

import Foundation
import XCTest

/*
 
 Given a string s and an integer array indices of the same length.
 The string s will be shuffled such that the character at the ith position moves to indices[i] in the shuffled string.
 Return the shuffled string.
 */


func restoreString(_ s: String, _ indices: [Int]) -> String {
    var sDict = [Int: String]()
    var newString = ""
    
    for (i,str) in s.enumerated() {
        sDict[indices[i]] = String(str)
    }
    
    for i in sDict.keys.sorted() {
        newString += sDict[i]!
    }
    
    return newString
    
}

XCTAssertEqual(restoreString("codeleet", [4,5,6,7,0,2,1,3]), "leetcode")

//: [Next](@next)
