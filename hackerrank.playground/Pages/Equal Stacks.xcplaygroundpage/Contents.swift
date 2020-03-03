//: [Previous](@previous)

import Foundation
// 4 out of 30
//https://www.hackerrank.com/challenges/equal-stacks/problem

//func equalStacks2(h1: [Int], h2: [Int], h3: [Int]) -> Int {
//    var h1_copy = Array(h1.reversed())
//    var h2_copy = Array(h2.reversed())
//    var h3_copy = Array(h3.reversed())
//
//    while !h1_copy.isEmpty && !h2_copy.isEmpty && !h3_copy.isEmpty {
//
//        let h1_r = h1_copy.reduce(0, +)
//        let h2_r = h2_copy.reduce(0, +)
//        let h3_r = h3_copy.reduce(0, +)
//
////        print("\(h1_copy)\n\(h2_copy)\n\(h3_copy)\n\n")
//        if h1_r == h2_r && h2_r == h3_r {
////            print(h1_r)
//            return h1_r
//        }
//
//        let largest = h1_r > h2_r ? (h1_r > h3_r ? h1_copy: h3_copy) : (h2_r > h3_r ? h2_copy: h3_copy)
//
//        if h1_copy == largest {
//            _ = h1_copy.popLast()
//        }
//
//        if h2_copy == largest {
//            _ = h2_copy.popLast()
//        }
//
//        if h3_copy == largest {
//            _ = h3_copy.popLast()
//        }
//    }
//
//    return 0
//}

//func equalStacks3(h1: [Int], h2: [Int], h3: [Int]) -> Int {
//    var h1_copy = h1
//    var h2_copy = h2
//    var h3_copy = h3
//
//    while !h1_copy.isEmpty && !h2_copy.isEmpty && !h3_copy.isEmpty {
//
//        let h1_r = h1_copy.reduce(0, +)
//        let h2_r = h2_copy.reduce(0, +)
//        let h3_r = h3_copy.reduce(0, +)
//
//        if h1_r == h2_r && h2_r == h3_r {
////            print(h1_r)
//            return h1_r
//        }
//        // find largest number from any 3 number
//        let largest = h1_r > h2_r ? (h1_r > h3_r ? h1_copy: h3_copy) : (h2_r > h3_r ? h2_copy: h3_copy)
//
//        if h1_copy == largest {
//            h1_copy = Array(h1_copy.dropFirst())
//        }
//
//        if h2_copy == largest {
//            h2_copy = Array(h2_copy.dropFirst())
//        }
//
//        if h3_copy == largest {
//            h3_copy = Array(h3_copy.dropFirst())
//        }
////        print("\(h1_copy)\n\(h2_copy)\n\(h3_copy)\n\n")
////        break
//    }
//
//    return 0
//}
//


func equalStacks(h1: [Int], h2: [Int], h3: [Int]) -> Int {
    var stack1 = h1
    var stack2 = h2
    var stack3 = h3

    var s1 = [Int]()
    var s2 = [Int]()
    var s3 = [Int]()

    while !stack1.isEmpty && !stack2.isEmpty && !stack3.isEmpty {
        let stack1Total = stack1.reduce(0, +)
        let stack2Total = stack2.reduce(0, +)
        let stack3Total = stack3.reduce(0, +)

        s1.append(stack1Total)
        s2.append(stack2Total)
        s3.append(stack3Total)

        stack1.removeFirst()
        stack2.removeFirst()
        stack3.removeFirst()
    }

    print(s1, s2, s3)

    for x in 0..<s1.count {
        for y in 0..<s2.count {
            for z in 0..<s3.count {

                let num1 = s1[x]
                let num2 = s2[y]
                let num3 = s3[z]

                print([num1, num2, num3])

                if num1 == num2 && num3 == num1 {
                    return s1[x]
                }
            }
        }
    }
    return 0
}

let a = [3, 2, 1, 1, 1]
let b = [4, 3, 2]
let c = [1, 1, 4, 1]


//1. 0.010203838348388672, 0.009802818298339844,
//2. 0.007379055023193359  0.0032219886779785156
//3. 0.0026569366455078125 0.002773761749267578
let start = Date()
print(equalStacks(h1: a, h2: b, h3: c)) // 5
let end = Date()
print(end.timeIntervalSince1970 - start.timeIntervalSince1970)
