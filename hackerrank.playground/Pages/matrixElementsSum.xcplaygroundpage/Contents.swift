//: [Previous](@previous)

import Foundation
import XCTest


/*
 
 After becoming famous, the CodeBots decided to move into a new building together.
 Each of the rooms has a different cost, and some of them are free, but there's a
 rumour that all the free rooms are haunted!
 
 Since the CodeBots are quite superstitious, they refuse to stay in any of the free rooms,
 or any of the rooms below any of the free rooms.

 Given matrix, a rectangular matrix of integers, where each value represents the cost of the room,
 your task is to return the total sum of all rooms that are suitable for the
 CodeBots (ie: add up all the values that don't appear below a 0).
 
 */



let matrix1 = [[0, 1, 1, 2],
              [0, 5, 0, 0],
              [2, 0, 3, 3]]

let matrix2 = [[1, 1, 1, 0],
              [0, 5, 0, 1],
              [2, 1, 3, 10]]

func matrixElementsSum(matrix: [[Int]]) -> Int {
    var count = 0
    var dict = [Int: [Int]]()
    
    for x in 0..<matrix.count {
        for y in 0..<matrix[x].count {
            let value = matrix[x][y]
            dict[y, default: []].append(value)
        }
    }
    
    for (k, _) in dict {
        for num in dict[k]! {
            if num == 0 {
                break
            } else {
                count += num
            }
        }
    }
    
    return count
}

XCTAssertEqual(matrixElementsSum(matrix: matrix1), 9)
XCTAssertEqual(matrixElementsSum(matrix: matrix2), 9)

