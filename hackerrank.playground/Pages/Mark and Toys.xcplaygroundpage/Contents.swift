//: [Previous](@previous)

import Foundation

// Mark and Toys
//https://www.hackerrank.com/challenges/mark-and-toys/problem?h_l=interview&playlist_slugs%5B%5D=interview-preparation-kit&playlist_slugs%5B%5D=sorting&h_r=next-challenge&h_v=zen

func maximumToys(prices: [Int], k: Int) -> Int {
    var units = 0
    var wallet = k
    var prices_copy = prices
    prices_copy.sort()

    for item in prices_copy {
        if wallet > 0 && wallet - item > 0 {
            wallet -= item
            units += 1
        }
    }
    return units
}


let prices = [1, 12, 5, 111, 200, 1000, 10]
let k = 50

let result = maximumToys(prices: prices, k: k)

print(result)


