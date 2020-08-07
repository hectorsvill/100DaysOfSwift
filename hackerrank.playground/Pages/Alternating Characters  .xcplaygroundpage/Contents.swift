//: [Previous](@previous)

import Foundation

/*
 
 https://www.hackerrank.com/challenges/alternating-characters/problem?h_l=interview&playlist_slugs%5B%5D=interview-preparation-kit&playlist_slugs%5B%5D=strings
 https://www.geeksforgeeks.org/minimum-number-characters-removed-make-binary-string-alternate/
 
Given a binary string, the task is to find minimum number of characters to be removed from it
so that it becomes alternate. A binary string is alternate if there are no two consecutive 0s
or 1s.

 */


func alternatingCharacters(binaryString: String) -> Int {
    let stringArr = Array(binaryString)
    var result = 0
    
    for index in 0..<stringArr.count - 1{
        if stringArr[index] == stringArr[index + 1] {
            result += 1
        }
    }
    
    return result
}

let deleteCount = alternatingCharacters(binaryString: " 000111")
print(deleteCount)
