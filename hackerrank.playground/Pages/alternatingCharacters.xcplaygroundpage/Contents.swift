//: [Previous](@previous)

import Foundation






//https://www.hackerrank.com/challenges/alternating-characters/problem?h_l=interview&playlist_slugs%5B%5D%5B%5D%5B%5D%5B%5D=interview-preparation-kit&playlist_slugs%5B%5D%5B%5D%5B%5D%5B%5D=strings&isFullScreen=true

func alternatingCharacters(s: String) -> Int {
    var s_array = Array(s).map { String($0) }
    var current = s_array[0]
    var del = 0

    var index = 1
    while index < s_array.count{
        if current == s_array[index] {
            s_array.remove(at: index)
            del += 1
        } else {
            current = s_array[index]
            index += 1
        }
    }
    print(s_array)
    return del
}

func alternatingCharacters2(s: String) -> Int {
    var current = s[s.startIndex]
    var del = 0

    for i in 1..<s.count {
        let index = s.index(s.startIndex, offsetBy: i)
        current == s[index] ? (del += 1) : (current = s[index])
    }

    return del
}




let d = alternatingCharacters2(s: "AAAA")
print(d)
