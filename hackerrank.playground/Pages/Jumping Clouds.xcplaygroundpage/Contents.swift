//: [Previous](@previous)

import Foundation

//https://www.hackerrank.com/challenges/jumping-on-the-clouds/problem?h_l=interview&playlist_slugs%5B%5D%5B%5D=interview-preparation-kit&playlist_slugs%5B%5D%5B%5D=warmup&isFullScreen=true




func jumpingOnClouds(c: [Int]) -> Int {
    var jumps = 0

    var i = 0

    while i < c.count {
//        if c[i] == 0 {
//            if i < c.count - 2 && c[i + 1] == 0 && c[i + 2] == 0 {
//                jumps += 1
//                i += 2
//            } else if i < c.count - 1 && c[i + 1] == 0 {
//                jumps += 1
//                i += 1
//            }
//        } else if c[i] == 1 {
//            jumps += 1
//        }
//
        if i + 2 < c.count && c[i + 2] == 0 {
            jumps += 1
        }

        i += 1
    }

    return jumps - 1
}



//53
let str = "0 1 0 0 0 0 0 1 0 1 0 0 0 1 0 0 1 0 1 0 0 0 0 1 0 0 1 0 0 1 0 1 0 1 0 1 0 0 0 1 0 1 0 0 0 1 0 1 0 1 0 0 0 1 0 1 0 0 0 1 0 1 0 0 0 1 0 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 0 1 0 1 0 1 0 1 0 0 0 0 0 0 1 0 0 0".trimmingCharacters(in: .whitespaces)

func getNumArray(str: String) -> [Int]{
    var num_list: [Int] = []
    
    _ = Array(str).map {
        if let n = Int(String($0)) {
            num_list.append(n)
        }
    }
    return num_list
}

print(num_list)
print(jumpingOnClouds(c: num_list))











//: [Next](@next)
