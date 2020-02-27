//: [Previous](@previous)

import Foundation

func convertToDecimal(_ perc: [String]) -> [Double] {
    return perc.map {
        let intString = $0.replacingOccurrences(of: "%", with: "")
        return Double(intString)! / Double(100)
    }
}

//print(convertToDecimal(["33%", "98.1%", "56.44%", "100%"]))

func sumDigits(_ a: Int, _ b: Int) -> Int {
    let digits = Array(a...b)
    var total = 0

    digits.forEach {
        var digit = $0

        while digit > 0 {
            total += digit % 10
            digit /= 10
        }
    }
    return total
}

//sumDigits(17, 20)

func subReddit(_ link: String) -> String {
    return link.replacingOccurrences(of: "https://www.reddit.com/r/", with: "").replacingOccurrences(of: "/", with: "")
}

//subReddit("https://www.reddit.com/r/relationships/")

func toArray(_ num: Int) -> [Int] {
    if num == 0 {
        return [0]
    }

    var numCopy = num

    var arr = [Int]()
    while numCopy > 0 {
        let digit = numCopy % 10
        arr.insert(digit, at: 0)
        numCopy /= 10
    }

    return arr
}

func toNumber(_ arr: [Int]) -> Int {
    if arr.isEmpty || arr.count == 1 {
        return arr[0]
    }

    var number = 0
    var mul = 1

    for _ in 0...arr.count - 2 {
        mul *= 10
    }

    for i in 0..<arr.count{
        number += (arr[i] * mul)
        mul /= 10

    }

    return number
}


//toArray(1234)
//toNumber([0])
