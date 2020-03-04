//: [Previous](@previous)

import Foundation


func fizzbuzz(_ n: Int) {
    for i in 1...n {
        if i % 3 == 0 && i % 5 == 0 {
            print("FizzBuzz")
        } else if i % 3 == 0 && i % 5 != 0 {
            print("Fiz")
        }else if i % 3 != 0 && i % 5 == 0 {
            print("Buzz")
        }else if i % 3 != 0 && i % 5 != 0 {
            print(i)
        }
    }
}

fizzbuzz(15)
