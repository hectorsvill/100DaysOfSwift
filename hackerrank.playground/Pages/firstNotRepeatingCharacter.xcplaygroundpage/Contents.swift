//: [Previous](@previous)

import Foundation
import XCTest

/*
 
 Given a string s consisting of small English letters,
 find and return the first instance of a non-repeating character in it.
 If there is no such character, return '_'.
 
 */


func firstNotRepeatingCharacter(s: String) -> Character {
    var dict = [Character: Int]()
    
    for c in s {
        dict[Character(String(c)), default: 0] += 1
    }
    
    for c in s {
        let character = Character(String(c))
        
        if dict[c]! == 1 {
            return character
        }
    }
        
    return Character("_")
}

XCTAssertEqual(firstNotRepeatingCharacter(s: "abacabad"), Character("c"))
XCTAssertEqual(firstNotRepeatingCharacter(s: "abacabaabacaba"), Character("_"))

//: [Next](@next)
