//: [Previous](@previous)

import Foundation

//https://www.hackerrank.com/challenges/equal-stacks/problem


//func equalStacks(h1: [Int], h2: [Int], h3: [Int]) -> Int {
//    var h1_copy = Array(h1.reversed())
//    var h2_copy = Array(h2.reversed())
//    var h3_copy = Array(h3.reversed())
//    
//    let h1_r = h1_copy.reduce(0, +)
//    let h2_r = h2_copy.reduce(0, +)
//    let h3_r = h3_copy.reduce(0, +)
//    
//    let largest = h1_r > h2_r ? (h1_r > h3_r ? h1_copy: h3_copy) : (h2_r > h3_r ? h2_copy: h3_copy)
//    
//    if h1_copy == largest {
//        _ = h1_copy.popLast()
//    }
//    
//    if h2_copy == largest {
//        _ = h2_copy.popLast()
//    }
//    
//    if h3_copy == largest {
//        _ = h3_copy.popLast()
//    }
//    
//    print("\(h1_copy)\n\(h2_copy)\n\(h3_copy)\n\n")
//    if h1_r == h2_r && h2_r == h3_r {
//        print(h1_r)
//        return h1_r
//    }else {
//        return equalStacks(h1: Array(h1_copy.reversed()), h2: Array(h2_copy.reversed()), h3: Array(h3_copy.reversed()))
//    }
//}
//


//func equalStacks(h1: [Int], h2: [Int], h3: [Int]) -> Int {
//    var h1_copy = h1
//    var h2_copy = h2
//    var h3_copy = h3
//
//    let h1_r = h1_copy.reduce(0, +)
//    let h2_r = h2_copy.reduce(0, +)
//    let h3_r = h3_copy.reduce(0, +)
//
//    let largest = h1_r > h2_r ? (h1_r > h3_r ? h1_copy: h3_copy) : (h2_r > h3_r ? h2_copy: h3_copy)
//
//    if h1_copy == largest {
//        h1_copy = Array(h1_copy.reversed())
////        _ = h1_copy.removeFirst()
//    }
//
//    if h2_copy == largest {
//        h2_copy = Array(h2_copy.reversed())
////        _ = h2_copy.removeFirst()
//    }
//
//    if h3_copy == largest {
//        h3_copy = Array(h3_copy.reversed())
////        _ = h3_copy.removeFirst()
//    }
//
//    print("\(h1_copy)\n\(h2_copy)\n\(h3_copy)\n\n")
//    if h1_r == h2_r && h2_r == h3_r {
//        return h1_r
//    }else {
//        return equalStacks(h1: h1_copy, h2: h2_copy, h3: h3_copy)
//    }
//
//}

func equalStacks2(h1: [Int], h2: [Int], h3: [Int]) -> Int {
    var h1_copy = Array(h1.reversed())
    var h2_copy = Array(h2.reversed())
    var h3_copy = Array(h3.reversed())
    
    while !h1_copy.isEmpty && !h2_copy.isEmpty && !h3_copy.isEmpty {
        
        let h1_r = h1_copy.reduce(0, +)
        let h2_r = h2_copy.reduce(0, +)
        let h3_r = h3_copy.reduce(0, +)
        
//        print("\(h1_copy)\n\(h2_copy)\n\(h3_copy)\n\n")
        if h1_r == h2_r && h2_r == h3_r {
//            print(h1_r)
            return h1_r
        }
        
        let largest = h1_r > h2_r ? (h1_r > h3_r ? h1_copy: h3_copy) : (h2_r > h3_r ? h2_copy: h3_copy)
        
        if h1_copy == largest {
            _ = h1_copy.popLast()
        }
        
        if h2_copy == largest {
            _ = h2_copy.popLast()
        }
        
        if h3_copy == largest {
            _ = h3_copy.popLast()
        }
    }
    
    return 0
}

let a = [3, 2, 1, 1, 1]
let b = [4, 3, 2]
let c = [1, 1, 4, 1]


//1. 0.010203838348388672, 0.009802818298339844,
//2. 0.007379055023193359 0.0032219886779785156
let start = Date()
print(equalStacks2(h1: a, h2: b, h3: c) == 5)
let end = Date()
print(end.timeIntervalSince1970 - start.timeIntervalSince1970)
