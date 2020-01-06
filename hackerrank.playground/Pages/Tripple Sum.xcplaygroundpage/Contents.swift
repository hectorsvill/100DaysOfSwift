//: [Previous](@previous)

import Foundation





func triplets(a: [Int], b: [Int], c: [Int]) -> Int {

    
    for x in 0..<a.count {
        
        for y in 0..<b.count {
            
            for z in 0..<c.count {
                
                print([a[x], b[y], c[z]])
                
            }
        }
        
    }
    

    return 0
}

let a = [1, 3, 5]
let b = [2, 3]
let c = [1, 2, 3]

triplets(a: a, b: b, c: c)
