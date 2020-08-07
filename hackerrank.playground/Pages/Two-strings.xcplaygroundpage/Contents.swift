import Foundation

// https://www.hackerrank.com/challenges/two-strings/problem

/*
    Given two strings, determine if they share a common substring.
    A substring may be as small as one character.
    return YES or NO
*/

func twoStrings(s1: String, s2: String) -> String {
    var s1Dictionary = [String: Int]()
    var s2Dictionary = [String: Int]()
    
    s1.forEach { s1Dictionary[String($0), default: 0 ] += 1}
    s2.forEach { s2Dictionary[String($0), default: 0 ] += 1}
    
    var charCount = 0
    
    for (key, value) in s1Dictionary {
        if let s2Value = s2Dictionary[key] {
            charCount += (value + s2Value) / 2
        }
    }
    
    return charCount == 0 ? "NO" : "YES"
}

twoStrings(s1: "hackerrankcommunity", s2: "cdecdecdecde")


/*
 --------------------
 wouldyoulikefries
 abcabcabcabcabcabc
 
 no
 --------------------
 hackerrankcommunity
 cdecdecdecde
 
 yes
 --------------------
 writetoyourparents
 fghmqzldbc
 
 no
 --------------------
 
 */

