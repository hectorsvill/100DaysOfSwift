//: [Previous](@previous)

// https://www.hackerrank.com/challenges/frequency-queries/problem?h_l=interview&playlist_slugs%5B%5D=interview-preparation-kit&playlist_slugs%5B%5D=dictionaries-hashmaps

import Foundation

func freqQuery(queries: [[Int]]) -> [Int] {
    var arr = [Int]()
    var dict = [Int: Int]()
    var outPut = [Int]()
    
    for q in queries {
        let query = q[0]
        let data = q[1]
        
        if query == 1 {
            dict[data, default: 0] += 1
            arr.append(data)
        } else if query == 2{
            if let index = arr.firstIndex(of: data) {
                arr.remove(at: index)
                dict[data]! -= 1
                if dict[data]! <= 0 {
                    dict[data] = nil
                }
            }
        } else if query == 3 {
            let value = dict.values.contains(data) ? 1 : 0
            outPut.append(value)
        }
    }
    
    return outPut
}

let q = [[1, 5], [1, 6], [3, 2], [1, 10], [1, 10], [1, 6], [2, 5], [3, 2]]

print(freqQuery(queries: q))
