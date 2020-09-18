//: [Previous](@previous)

import Foundation
import XCTest


func findMissingLetter(_ chArr: [Character]) -> Character {
    var asciiValueLastState = chArr[0].asciiValue!
    
    for i in 1..<chArr.count {
        
        let total = asciiValueLastState + 1
        
        if !(total == chArr[i].asciiValue!) {
            let u = UnicodeScalar(total)
            return Character(u)
        }
        
        asciiValueLastState = chArr[i].asciiValue!
        
    }
    
    return Character("")
}

//let chArr: [Character] = ["a", "b", "c", "d", "f"]
//let c = findMissingLetter(chArr)
//print(c)

func encryptThis(text:String) -> String{
    // Your awesome code goes here!
    
    var newString = ""
    
    let words = text.split(separator: " ")
    
    for word in words {
        if !newString.isEmpty {
            newString += " "
        }
        
        var wordArrary =  word.map { return Character(String($0))}
        
        if wordArrary.count > 2 {
            wordArrary.swapAt(1, wordArrary.count - 1)
        }
        
        var str = "\(wordArrary.first!.asciiValue!)"
        wordArrary.remove(at: 0)
        
        wordArrary.forEach {
            str += String($0)
        }
        
        newString += str
    }
    
    return newString
}
//let s = encryptThis(text: "A wise old owl lived in an oak")
//print(s)

// two sum
func twosum(numbers: [Int], target: Int) -> [Int] {
    var dict = [Int: Int]()
    
    for i in 0..<numbers.count {
        let number = numbers[i]
        let newTarget = target - number
        
        if let index = dict[newTarget] {
            return [index, i]
        }
        
        dict[number] = i
    }
    
    return []
}

//twosum(numbers: [1,54,24,35], target: 59)

func countDuplicates(_ s:String) -> Int {
    var dict = [String: Int]()
    
    for c in s {
        let string = String(c)
        dict[string, default: 0] += 1
    }
    
    var total = 0
    
    dict.values.forEach{
        if $0 > 1{
            total += 1
        }
    }
    
    return total
}

func flattenAndSort<T: Comparable>(_ arr: [[T]]) -> [T] {
    var newList = [T]()
    arr.forEach { newList.append(contentsOf: $0) }
    return newList.sorted()
}

//let result = flattenAndSort([[3, 2, 1], [4, 6, 5], [], [9, 7, 8]])
//print(result)

func rgb(_ r: Int, _ g: Int, _ b: Int) -> String {
    return [r,g,b].map { return String(format: "%02X", min(255, max(0, $0))) }.joined()
}

//let rgbString = rgb(251, 251, -2)




/*
 https://www.codewars.com/kata/526571aae218b8ee490006f4/train/swift
 
 Write a function that takes an integer as input, and returns the number of bits that are equal
 to one in the binary representation of that number. You can guarantee that input is non-negative.

 Example: The binary representation of 1234 is 10011010010, so the function should return 5 in this case
 
 */

func countBits(_ n: Int) -> Int {
    String(n, radix: 2).filter{ $0 == "1" }.count //.replacingOccurrences(of: "0", with: "").count
}

XCTAssert(countBits(1) == 1)
XCTAssert(countBits(10) == 2)



/*
 A prime is a natural number greater than 1 that has no positive divisors other than 1 and itself.
 Examples of first few prime numbers are {2, 3, 5,
 */

func isPrime(_ number: Int) -> Bool {
    if number <= 1 { return false }
    
    for index in 2..<number {
        if number % index == 0 {
            return false
        }
    }
    
    return true
}

XCTAssertTrue(isPrime(2))
XCTAssertTrue(isPrime(3))
XCTAssertTrue(isPrime(5))

/*
 
 Create a function that returns the sum of the two lowest positive numbers
 given an array of minimum 4 positive integers. No floats or non-positive
 integers will be passed.
 
 */

func sumOfTwoSmallestIntegersIn(_ array: [Int]) -> Int {
  return array.sorted()[0...1].reduce(0, +)
}

XCTAssertTrue(sumOfTwoSmallestIntegersIn([1,2,3,4,5]) == 3)
XCTAssertTrue(sumOfTwoSmallestIntegersIn([4,5,6,7,8,9]) == 9)


/*
 
 Given a number, return a string with dash'-'marks before and after each odd
 integer, but do not begin or end the string with a dash mark.
 
 */


func dashatize(_ number: Int) -> String {
    let number = number < 0 ? -number : number
    
    let stringArray = String(number).map {
        Int(String($0))! % 2 == 0 ? "\($0)" : "-\($0)-"
    }
    print(stringArray)
    
    var stringed = stringArray.joined(separator: "")
    
    if stringed.first == "-" {
        stringed.remove(at: stringed.startIndex)
    }
    
    if stringed.last == "-" {
        stringed = String(stringed.dropLast())
    }
    
    return stringed.replacingOccurrences(of: "--", with: "-")
}

dashatize(6815) // 68-1-5
dashatize(3274) // 2-7-4
dashatize(-5311) //  -5-3-1-1
dashatize(5311) //  5-3-1-1
