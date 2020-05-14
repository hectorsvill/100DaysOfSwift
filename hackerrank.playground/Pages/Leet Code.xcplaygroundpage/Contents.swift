//: [Previous](@previous)
//
import Foundation
//



func findTarget(arr: [Int], target: Int) -> [Int]{
    var dict: [Int: Int] = [:]

    for (i, item) in arr.enumerated() {
        let newTarget = target - item

        if let number = dict[newTarget] {
            return [item, arr[number]]
        } else {
            dict[item, default: 0] = i
        }
    }

    return []
}


//findTarget(arr: [1,2,3,4,5,17,100], target: 103)

class Parent {
    var child: Child?
}

class Child {
    var parent: Parent?
}


//let p = Parent()
//let c = Child()
//p.child = c
//c.parent = p
//
//print(p.child ?? nil)
//print(c.parent ?? nil)
//
//p.child = nil
//c.parent = nil
//print(p.child ?? nil)
//print(c.parent ?? nil)


public class ThermometerClass {
    private(set) var temperature: Double = 0.0

    public func registerTemperature(_ temperature: Double)  {
        self.temperature = temperature
    }
}

//let thermometerClass = ThermometerClass()
//thermometerClass.registerTemperature(56.0)

public struct ThermometerStruct {
    private(set) var temperature: Double = 0.0
    public mutating func registerTemperature(_ temperature: Double) {
        self.temperature = temperature
    }
}

//var thermometerStruct = ThermometerStruct()
//thermometerStruct.registerTemperature(56.0)

var thing = "cars"

let closure = { [thing] in
    print(thing)
}

//thing = "fpv"
//closure()

func countUniques<T: Comparable>(_ array: Array<T>) -> Int {
    let sorted = array.sorted()

    let initial: (T?, Int) = (.none, 0)

    let reduced = sorted.reduce(initial) {
        ($1, $0.0 == $1 ? $0.1 : $0.1 + 1)
    }

    return reduced.1
}

//countUniques([1, 2, 3, 3]) // result is 3

extension Array where Element: Comparable {
    func countUniques() -> Int {
        let sortedValues = sorted()

        let initial: (Element?, Int) = (.none, 0)

        let reduced = sortedValues.reduce(initial) {
            ($1, $0.0 == $1 ? $0.1 : $0.1 + 1)
        }

        return reduced.1
    }
}

//[1, 2, 3, 3, 8].countUniques() // should print 3

func divide(_ dividend: Double?, by divisor: Double?) -> Double? {
    guard
        let dividend = dividend,
        let divisor  = divisor,
        divisor  != 0

        else { return nil }
    return dividend / divisor
}

//divide(10, by: 3)


//func smallerNumbersThanCurrent(_ nums: [Int]) -> [Int] {
//    var lowerCountArray = [Int]()
//
//    for targets in nums {
//        var lowerNumberCount = 0
//
//        for n in nums {
//            if n < targets {
//                lowerNumberCount += 1
//            }
//        }
//
//        lowerCountArray.append(lowerNumberCount)
//    }
//    return lowerCountArray
//}

func smallerNumbersThanCurrent(_ nums: [Int]) -> [Int] {
    let numsSorted = nums.sorted()
    var lowerCountArray = [Int]()

    for targets in numsSorted {
        var lowerNumberCount = 0

        for n in numsSorted {
            if n < targets {
                lowerNumberCount += 1
            }
        }

        lowerCountArray.append(lowerNumberCount)
    }
    return lowerCountArray
}

//smallerNumbersThanCurrent([6,5,4,8, 8])

func kidsWithCandies(_ candies: [Int], _ extraCandies: Int) -> [Bool] {
    var checkArr = [Bool]()
    let max = candies.max()!

    for kid in candies {
        let newValue = kid + extraCandies
        checkArr.append(newValue >= max)
    }

    return checkArr
}

//kidsWithCandies([12,1,12],  10) // [true,true,true,false,true]

func numberOfSteps (_ num: Int) -> Int {
    var steps = 0
    var numCopy = num

    while numCopy > 0 {
        (numCopy % 2 == 0) ? (numCopy /= 2) : (numCopy -= 1)
        steps += 1
    }

    return steps
}

//numberOfSteps(16)


func createTargetArray(_ nums: [Int], _ index: [Int]) -> [Int] {
    var newArr = [Int]()

    for (i, item) in nums.enumerated() {
        newArr.insert(item, at: index[i]);
    }

    return newArr
}


createTargetArray([0,1,2,3,4], [0,1,2,2,1]) // [0,4,1,3,2]





