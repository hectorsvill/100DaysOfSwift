//: [Previous](@previous)

import Foundation
// https://www.hackerrank.com/challenges/grading/problem

func getNextFithMultiple(_ num: Int) -> Int{
    var f = num
    
    while f % 5 != 0 {
        f += 1
    }
    
    return f
}

func gradingStudents(grades: [Int]) -> [Int] {
    
    var new_grade = [Int]()
    
    for grade in grades {
        if grade < 38 {
            new_grade.append(grade)
        } else {
            if grade % 5 == 0 {
                new_grade.append(grade)
            } else {
                let next = getNextFithMultiple(grade)
                let value = next - grade < 3 ? next : grade
                new_grade.append(value)
                    
            }
        }
    }
    
    return new_grade
}



//: [Next](@next)
func threeNumberSumSolution(numbers: [Int], sum: Int) -> [[Int]] {
    let sortedNumbers = numbers.sorted()
    var triplets: [[Int]] = [[Int]]()
    
    for i in 0...sortedNumbers.count - 2 {
        var left = i + 1
        var right = sortedNumbers.count - 1
        while left < right {
            let currentSum = sortedNumbers[i] + sortedNumbers[left] + sortedNumbers[right]
            if currentSum == sum {
                if !triplets.contains([sortedNumbers[i], sortedNumbers[left], sortedNumbers[right]]) {
                    triplets.append([sortedNumbers[i], sortedNumbers[left], sortedNumbers[right]])
                }
                left += 1
                right -= 1
            } else if currentSum < sum {
                left += 1
            } else if currentSum > sum {
                right -= 1
            }
        }
    }
    return triplets
}

let answer = threeNumberSumSolution(numbers: [-1,0,1,2,-1,-4], sum: 0)
print(answer)
