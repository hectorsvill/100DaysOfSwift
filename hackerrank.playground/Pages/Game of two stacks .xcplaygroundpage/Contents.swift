//: [Previous](@previous)

import Foundation

func twoStacks(x: Int, a: [Int], b: [Int]) -> Int {
    var a_copy = a
    var b_copy = b
    var itens_count = 0
    var current_total = 0

    while current_total != x {
        let item_a = a_copy.remove(at: 0)
        current_total += item_a

        let item_b = b_copy.remove(at: 0)
        current_total += item_b

        itens_count += 2
        print(item_a)
        break
    }


    return 0
}

let x = 10
let a = [4, 2, 4, 6, 1]
let b = [2, 1, 8, 5]


twoStacks(x: x, a: a, b: b)

