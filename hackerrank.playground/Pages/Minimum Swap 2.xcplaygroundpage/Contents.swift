//: [Previous](@previous)

import Foundation
// Your code did not execute within the time limits <--- 4 test
// https://www.hackerrank.com/challenges/minimum-swaps-2/problem?h_l=interview&playlist_slugs%5B%5D=interview-preparation-kit&playlist_slugs%5B%5D=arrays

func minimumSwaps(arr: [Int]) -> Int {
    var swaps = 0
    var arr_copy = arr
    let sorted_arr = arr.sorted()

    for i in 0..<arr.count - 1{
        if arr_copy[i] != sorted_arr[i] {
            let low = sorted_arr[i]
            let index = arr_copy.firstIndex(of: low)!
            (arr_copy[i], arr_copy[index]) = (arr_copy[index], arr_copy[i])

            swaps += 1
            
            if arr_copy == sorted_arr {
                break
            }
        }
    }
    return swaps
}


let arr = [4, 3, 1, 2]
let arr1 = [7, 1, 3, 2, 4, 5, 6]

let date1 = Date()
minimumSwaps(arr: arr1)

let date2 = Date()

print(date2.timeIntervalSince1970 - date1.timeIntervalSince1970)
