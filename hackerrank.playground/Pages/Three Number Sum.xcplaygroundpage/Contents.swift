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









let x = [73, 67 ,38 , 33]

print(gradingStudents(grades: x))







//: [Next](@next)
