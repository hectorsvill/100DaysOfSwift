//: [Previous](@previous)

import Foundation

// Sorting: Bubble Sort
//https://www.hackerrank.com/challenges/ctci-bubble-sort/problem?h_l=interview&playlist_slugs%5B%5D=interview-preparation-kit&playlist_slugs%5B%5D=sorting





// Complete the countSwaps function below.
func countSwaps(a: [Int]) -> Void {
    var a_copy = a
    var numberOfSwaps = 0

    for _ in 0...a_copy.count - 1 {
        for i in 0..<a_copy.count - 1 {
            if a_copy[i] > a_copy[i + 1] {
                a_copy.swapAt(i, i + 1)
                numberOfSwaps += 1
            }
        }
    }

    print("Array is sorted in \(numberOfSwaps) swaps.")
    print("First Element: \(a_copy.first!)")
    print("Last Element: \(a_copy.last!)")
}

let arr = [1,2,5,3,0]

countSwaps(a: arr)
