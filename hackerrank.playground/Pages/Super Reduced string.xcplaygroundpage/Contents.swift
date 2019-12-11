//: [Previous](@previous)

import Foundation


//https://www.hackerrank.com/challenges/reduced-string/problem


func superReducedString(s: String) -> String {

    var sCopy = Array(s)
    
    var i = 0
    
    while i < sCopy.count - 1{
        if sCopy[i + 1] == sCopy[i] {
            _ = sCopy.remove(at: i)
            _ = sCopy.remove(at: i)
            print(sCopy)
            i = 0
        } else {
            i += 1
        }
    }

    let str = sCopy.map { String($0) }.joined()
//    print(str)
    return str.isEmpty ? "Empty String" : str
}

print(superReducedString(s: "aaabccddd"))

























//: [Next](@next)
