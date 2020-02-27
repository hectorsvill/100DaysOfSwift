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

sumDigits(17, 20)


