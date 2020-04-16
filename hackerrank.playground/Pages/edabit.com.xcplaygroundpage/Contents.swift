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

func getProducts(_ arr: [Int]) -> [Int] {
    var products = [Int]()

    for i in 0..<arr.count {
        var product = 1

        for number in 0..<arr.count {
            if i != number {
                product *= arr[number]
            }
        }
        products.append(product)
    }

    return products
}

//getProducts([1, 7, 3, 4]) //➞ [84, 12, 28, 21]

//getProducts([1, 7, 3, 4]) //➞ [84, 12, 28, 21]

//getProducts([1, 2, 3, 0, 5]) //➞ [0, 0, 0, 30, 0]
//

func isPalindrome(_ str: String) -> Bool {
    let str = str.lowercased()
    var newString = String()

    str.forEach {
        let asciiValue = $0.asciiValue!

        if asciiValue >= 97 && asciiValue <= 123 ||
            asciiValue >= 65 && asciiValue <= 90 {
            newString += String($0)
        }
    }

    return String(newString.reversed()) == newString
}

//isPalindrome("Neuquen") //➞ true
//
//isPalindrome("Not a palindrome") //➞ false
//
//isPalindrome("A man, a plan, a cat, a ham, a yak, a yam, a hat, a canal-Panama!") //➞ true


func firstLast(_ arr: [Any]) -> [Any] {
    let newarr = [arr.first!, arr.last!]
    return newarr
}

func removeFirstLast(_ str: String) -> String {
    var newStr = Array(str)
    newStr.remove(at: 0)
    newStr.remove(at: newStr.count - 1)

    return String(newStr)
}

//removeFirstLast("thisis")

func nthSmallest(_ arr: [Int], _ n: Int) -> Int? {
    let arrCopy = arr.sorted()
    return n < arrCopy.count ? arrCopy[n - 1] : nil
}



func minMax(_ arr: [Double]) -> [Double] {
    return [arr.min()!, arr.max()!]
}

//minMax([0, 21, 1, -2 ])

func setify(_ arr: [Int]) -> [Int] {

    let set = Set<Int>(arr)
    return Array(set).sorted()
}

//setify([0,0,1,1,2,3,4,5,6])


func filterDigitLength(_ arr: [Int], _ num: Int) -> [Int] {
    var newArr = [Int]()

    for i in 0..<arr.count {
        var number = arr[i]
        var count = 0

        while number > 0 {
            number /= 10
            count += 1
        }

        if count == num {
            newArr.append(arr[i])
        }
    }

    return newArr
}

//filterDigitLength([88, 232, 4, 9721, 555], 3)


func factorize(_ num: Int) -> [Int] {
    var factors = [Int]()
    for i in 1..<num {
        if num % i == 0 {
            factors.append(i)
        }
    }
    factors.append(num)
    return factors
}

factorize(12) //[1, 2, 3, 4, 6, 12]
