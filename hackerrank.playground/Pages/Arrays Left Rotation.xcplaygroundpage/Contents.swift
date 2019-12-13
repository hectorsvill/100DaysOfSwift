//: [Previous](@previous)

// https://www.hackerrank.com/challenges/ctci-array-left-rotation/


import Foundation

func rotateRight(_ a: [Int]) -> [Int] {
    var a_Copy = [Int]()
    
    a_Copy.append(a.last!)
    for i in 1..<a.count {
        a_Copy.append(a[i - 1])
    }
    
    return a_Copy
}

func rotateLeft(_ a: [Int]) -> [Int] {
    var a_Copy = [Int]()
    
    for i in 0..<a.count - 1 {
        a_Copy.append(a[i + 1])
    }
    a_Copy.append(a.first!)
    
    return a_Copy
}


func rotLeft(a: [Int], d: Int) -> [Int] {
    var a_Copy = a
    
    for _ in 0..<d {
        a_Copy = rotateLeft(a_Copy)
        print(a_Copy)
    }
    
    return a_Copy
}


let test1 = [1,2,3,4,5] // [2,3,4,5,1]

print(rotLeft(a: test1, d: 4))
