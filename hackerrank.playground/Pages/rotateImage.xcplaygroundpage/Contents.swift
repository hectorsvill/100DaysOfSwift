//: [Previous](@previous)

import Foundation
import XCTest

/*
 
 You are given an n x n 2D matrix that represents an image.
 Rotate the image by 90 degrees (clockwise).
 
 */

func rotateImage(a: [[Int]]) -> [[Int]] {
    var newImage = [[Int]]()
    
    for x in 0..<a.count {
        var arr = [Int]()
        
        for y in 0..<a[x].count {
            let value = a[(a.count - 1) - y][x]
            arr.append(value)
            
        }
        newImage.append(arr)
    }
    
    return newImage
}

let a = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
let rotation1 = [[7, 4, 1], [8, 5, 2], [9, 6, 3]]
let rotation2 = [[9, 8, 7], [6, 5, 4], [3, 2, 1]]
let rotation3 = [[3, 6, 9], [2, 5, 8], [1, 4, 7]]

XCTAssertEqual(rotateImage(a: a), rotation1)
XCTAssertEqual(rotateImage(a: rotation1), rotation2)
XCTAssertEqual(rotateImage(a: rotation3), a)


//: [Next](@next)
