//: [Previous](@previous)

import Foundation
import XCTest



/*
 
 insert x y - {x:y}
 get x - return x
 addToKey x - add x
 addToValue y - add y
 
 */

//: [Next](@next)

enum QueryTypes: String {
    case inisert = "insert"
    case get = "get"
    case addToKey = "addToKey"
    case addToValue = "addToValue"
}

func hashMap(queryType: [QueryTypes], query: [[Int]]) -> Int64 {
    var hashMap = [Int: Int]()
    var sumeOfGetQuerie = 0
    
    for index in 0..<queryType.count {
        let type = queryType[index]
        let q = query[index]
        
        switch type {
        case .inisert:
            hashMap[q[0], default: 0] = q[1]
        case .get:
            sumeOfGetQuerie += hashMap[q[0]]!
        case .addToKey:
            var newDict = [Int: Int]()
            
            for (k,v) in hashMap {
                newDict[k + q[0]] = v
            }
            
            hashMap = newDict
        case .addToValue:
            hashMap[q[0]]! += q[0]
        }
    }
    
    return Int64(sumeOfGetQuerie)
}


let queryTypes1: [QueryTypes] = [.inisert, .inisert,.addToValue, .addToKey, .get, .addToKey, .get, .addToKey]
let queres1 =  [[1,2], [2,3], [2], [1], [3], [2], [5], [1]]

XCTAssertEqual(hashMap(queryType: queryTypes1, query: queres1), 10)


