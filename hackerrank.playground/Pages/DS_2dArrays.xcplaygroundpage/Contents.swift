//: [Previous](@previous)

import Foundation

// Complete the hourglassSum function below.
func hourglassSum(arr: [[Int]]) -> Int {

    var values: [Int] = []

    for x in 0...3 {
        for y in 0...3 {
            let value = arr[x][y] + arr[x][y + 1] + arr[x][y + 2] +
                        arr[x + 1][y + 1] +
                        arr[x + 2][y] + arr[x + 2][y + 1] + arr[x + 2][y + 2]
            values.append(value)
        }
        
        
        
    }
    print(values)
    return values.max()!
}
    
