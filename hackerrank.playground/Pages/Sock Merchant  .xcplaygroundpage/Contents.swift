//: [Previous](@previous)

// https://www.hackerrank.com/challenges/sock-merchant/problem?h_l=interview&playlist_slugs%5B%5D%5B%5D=interview-preparation-kit&playlist_slugs%5B%5D%5B%5D=warmup

import Foundation

func sockMerchant(n: Int, ar: [Int]) -> Int {
    var socks: [Int: Int] = [:]
    var evenSocksCount = 0
    
    for item in ar {
        socks[item, default: 0] += 1
    }

    for (value) in socks.values {
        evenSocksCount += value / 2
        print(evenSocksCount)
    }
    
    return evenSocksCount
}













//: [Next](@next)
