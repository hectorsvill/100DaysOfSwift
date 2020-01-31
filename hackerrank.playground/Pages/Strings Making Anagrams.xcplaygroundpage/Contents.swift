//: [Previous](@previous)

// https://www.hackerrank.com/challenges/ctci-making-anagrams/problem?h_l=interview&playlist_slugs%5B%5D=interview-preparation-kit&playlist_slugs%5B%5D=strings

import Foundation

func makeAnagram(a: String, b: String) -> Int {
    var deletions = 0
    var a_sorted = a.sorted().map {String($0)}
    var b_sorted = b.sorted().map {String($0)}
    var anagram = ""


    var a_index = 0
    var b_index = 0
    print("\(a_sorted)\n\(b_sorted)")

    while a_index < a_sorted.count && b_index < b_sorted.count{
        let a = a_sorted[a_index]
        let b = b_sorted[b_index]

        if a == b {
            anagram += a_sorted[a_index]
            a_sorted.remove(at: a_index)
            b_sorted.remove(at: b_index)
        } else if a < b{
            a_index += 1
        } else {
            b_index += 1
        }
    }

    deletions = a_sorted.count + b_sorted.count
    print("\(anagram)")
    return deletions
}

let a = "fcrxzwscanmligyxyvym"
let b = "jxwtrhvujlmrpdoqbisbwhmgpmeoke"
let c = 30

let m = makeAnagram(a: a, b: b)
print("deletions: ",  m)
