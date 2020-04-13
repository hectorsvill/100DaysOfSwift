//: [Previous](@previous)

import Foundation

func largestSubValue(array: [Int]) -> Int {
    var values = [Int]()
    for i in 0..<array.count{
        for y in i + 1..<array.count {
//            print([array[i], array[y]])
            let value = array[i] * array[y]
            values.append(value)
        }
    }

   // print(values)
    return values.reduce(0, +)
}


func largestValue(array: [Int]) -> Int{

    var largestValue = 0

    for a in 0..<array.count {
        for b in a+1..<array.count {
            for c in b+1..<array.count {
                for d in c+1..<array.count {

                    let values = [array[a], array[b], array[c], array[d]]
                    let value = largestSubValue(array: values)

                    if value > largestValue {
                        largestValue = value
                        print(values, value)
                    }

                }
            }
        }
    }
    return largestValue
}


let a = [5, 7, -5, 6, 3, 9, -8, 2, -1, 10]
let b = [7, 2, -1, 2]
let c = [-3, 7, -2, 3, 5, -2]
//let v = largestValue(array: a)
//print(v)

let z = largestSubValue(array: a)
