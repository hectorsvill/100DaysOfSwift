//: [Previous](@previous)

import Foundation
///Stacks are like arrays, but with limited functionality.
/// You can only push to add a new element to the top of the stack, pop to
/// remove the element from the top, and peek at the top element without popping it off.

func getHashMap(_ arr: [String]) -> [String: Int] {
    var map: [String: Int] = [:]

    for value in arr {
        if map[String(value)] != nil {
            let count = map[String(value)]!
            map.updateValue(count + 1, forKey: String(value))
        } else {
            map.updateValue(1, forKey: String(value))
        }
    }

    return map
}


// Complete the checkMagazine function below.
func checkMagazine(magazine: [String], note: [String]) -> Void {
    var answer = "Yes"

    let mMap = getHashMap(magazine)
    let nMap = getHashMap(note)

     print("\(mMap)\n\(nMap)")
    for (k,v) in nMap {
        if mMap[k] != nil {
            if mMap[k]! - v < 0 {
                answer = "No"
                break
            }
        } else if mMap[k] == nil {
            answer = "No"
            break
        }
    }
    print(answer)
}


//let mag = "apgo clm w lxkvg mwz elo bg elo lxkvg elo apgo apgo w elo bg".split(separator: " ").map { String($0) }
//let note = "elo lxkvg bg mwz clm w".split(separator: " ").map { String($0) }

let mag = "give me one grand today night".split(separator: " ").map { String($0) }
let note = "give one grand today".split(separator: " ").map { String($0) }


checkMagazine(magazine: Array(mag), note: Array(note))







//: [Next](@next)
