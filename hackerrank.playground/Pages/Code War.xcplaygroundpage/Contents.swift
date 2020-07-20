//: [Previous](@previous)

import Foundation

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


























