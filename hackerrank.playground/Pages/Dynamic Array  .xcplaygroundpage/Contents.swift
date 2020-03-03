//: [Previous](@previous)

import Foundation

let firstBits:  uint8 = 0b0101
let secondBits: uint8 = 0b1100

// MARK: Bitwise Operators

// MARK: NOT - inverts all bits an numbers
let initialBits: UInt8 = 0b00000000
let invertedBits = ~initialBits

// MARK: AND - if both inputs set to 1, new bit is set to 1
let and = firstBits & secondBits

// MARK: OR - if bot inputs are equal return 1, if not equeal return a 0
let or = firstBits | secondBits

// MARK: XOR - if both inputs are the same set to 0, else set to 1
let xor = firstBits ^ secondBits

// MARK: Shift Operators
let shiftBits: UInt8 = 0b1100

shiftBits << 1


print("Bit: \(shiftBits)\n\t<< 1 = \(shiftBits << 10)\n\t>> 1 = \(shiftBits >> 10)")
















let arr = [[1, 0, 5], [1, 1, 7], [1, 0, 3], [2, 1, 0], [2, 1, 1]]

func dynamicArray(n: Int, queries: [[Int]]) -> [Int] {
    // Write your code here
    print(queries)
    return []
}

dynamicArray(n: 2, queries: arr)
