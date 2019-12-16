//: [Previous](@previous)

import Foundation


//https://www.hackerrank.com/challenges/array-left-rotation/problem
//failed test 8, 9 # Your code did not execute within the time limits



func rot1(_ arr: [Int]) -> [Int] {
    var newArr = Array(arr[1..<arr.count])
    newArr.append(arr.first!)
    return newArr
}

func printArr(_ arr: [Int]) {
    _ = arr.map { print($0, terminator: " ") }
    print("")
}

//0(n^2)
func rotLeft(arr: [Int], rot: Int) {

    if rot == arr.count {
        printArr(arr)
        return
    }
    
    let rotCount = rot % arr.count
    
    var newArr = arr
    for _ in 0..<rotCount {
        newArr = rot1(newArr)
    }
    printArr(newArr)

}

//0(n)
func rotLeft2(arr: [Int], rot: Int) {
    let rotCount = rot % arr.count
    var newArr = Array(repeating: 0, count: arr.count)
    
    for i in 0..<arr.count {
        let location = (i + arr.count - rotCount) % arr.count
        newArr[location] = arr[i]
    }
    printArr(newArr)

}


let arr = [1,2,3,4,5]
let numberOfRotations = 44
rotLeft2(arr: arr, rot: numberOfRotations)
rotLeft(arr: arr, rot: numberOfRotations)










//: [Next](@next)
