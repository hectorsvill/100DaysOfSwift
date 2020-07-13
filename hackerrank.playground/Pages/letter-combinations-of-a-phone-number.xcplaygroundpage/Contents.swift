//: [Previous](@previous)

import Foundation
//https://www.geeksforgeeks.org/iterative-letter-combinations-of-a-phone-number/
//https://leetcode.com/problems/letter-combinations-of-a-phone-number/submissions/
//https://leetcode.com/articles/letter-combinations-of-a-phone-number/

//
func letterCombinations(_ digits: String) -> [String] {
    guard !digits.isEmpty else { return [] }
    
    let numberPad = ["2": "abc", "3": "def", "4": "ghi", "5": "jkl", "6": "mno", "7": "pqrs", "8": "tuv", "9": "wxyz"]
    
    let digits = digits.map { return String($0) }
    var combinations = [String]()
    var queue = [String]()
    
    queue.append("")
    
    while queue.count != 0 {
        print(queue)
        let permutation = queue.popLast()!
        if permutation.count == digits.count {
            combinations.append(permutation)
        } else {
            let numberPadValue = numberPad[digits[permutation.count]]!
            for letter in numberPadValue {
                queue.append(permutation + String(letter))
            }
        }
        
    }
    
    return combinations
}



let values = letterCombinations("4659")
print(values)
