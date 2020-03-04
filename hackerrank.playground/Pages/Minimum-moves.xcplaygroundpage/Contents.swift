//: [Previous](@previous)

import Foundation

func minimumMoves(_ arr1: [Int], _ arr2: [Int]) -> Int {
    var moves = 0

    for i in 0..<arr1.count {
        var number1Copy = arr1[i]
        var number2Copy = arr2[i]

        while number1Copy > 0 || number2Copy > 0 {
            let number1 = number1Copy % 10
            let number2 = number2Copy % 10

            if number1 != number2 {
                let diff = abs(number1 - number2)
                moves += diff
            }

            number1Copy /= 10
            number2Copy /= 10
        }
    }

    return moves
}


minimumMoves([123, 567], [321, 678])
