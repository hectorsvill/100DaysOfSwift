



import Foundation
//https://www.hackerrank.com/challenges/jumping-on-the-clouds/problem?h_l=interview&playlist_slugs%5B%5D=interview-preparation-kit&playlist_slugs%5B%5D=warmup
// Complete the jumpingOnClouds function below.


func jumpingOnClouds(c: [Int]) -> Int {
    var jumps = 0
    var i = 0

    while i < c.count {
        if c[i] == 0 {
            if i + 2 < c.count && c [i + 1] == 0 && c[i + 2] == 0 {
                i += 1
            }

            jumps += 1
        }

        i += 1
    }

    return jumps - 1
}















//: [Next](@next)
