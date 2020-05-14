//: [Previous](@previous)

import Foundation



func isBalanced(s: String) -> String {
    var stack = [String]()

    for bracket in s {
        if bracket == "{" || bracket == "[" || bracket == "(" {
            stack.append(String(bracket))
        } else {
            if bracket == "}" {
                guard
                    let last = stack.last,
                    last == "{",
                    let _ = stack.popLast()
                    else { return "NO" }

            } else if bracket == "]" {
                guard
                    let last = stack.last,
                    last == "[",
                    let _ = stack.popLast()
                    else { return "NO" }

            } else if bracket == ")" {
                guard
                    let last  = stack.last,
                    last == "(",
                    let _ = stack.popLast()
                    else { return "NO" }
            }
        }
    }

    return stack.isEmpty ? "YES" : "NO"
}


isBalanced(s: "}({}([][]))[]()")


//
//func checkINverse(myStack: [String], bracket: String) -> Bool {
//    guard let last = myStack.last else { return false }
//    return last != bracket ? false : true
//}
//
//// Complete the isBalanced function below.
//func isBalanced_version0(s: String) -> String {
//
//    var answer = "YES"
//    let sArray = Array(s)
//
//    if sArray[0] == "}" || sArray[0] == "}" || sArray[0] == "}" {
//        return "NO"
//    }
//
//    var myStack: [String] = []
//
//    print(sArray)
//    for item in sArray {
//        if item == "[" || item == "(" || item == "{" {
//            // if we find opening bracket push it to a stack
//            myStack.append(String(item))
//        }
//
//        if String(item) == "]" {
//            let check = checkINverse(myStack: myStack, bracket: "[")
//            if check  {
//                guard let _ = myStack.popLast() else { return "NO" }
//                // print(value)
//            } else {
//                answer = "NO"
//                break
//            }
//        } else if String(item) == ")" {
//            let check = checkINverse(myStack: myStack, bracket: "(")
//            if check  {
//                guard let _ = myStack.popLast() else { return "NO" }
//            } else {
//                answer = "NO"
//                break
//            }
//        } else if String(item) == "}" {
//            let check = checkINverse(myStack: myStack, bracket: "{")
//            if check  {
//                guard let _ = myStack.popLast() else { return "NO" }
//            } else {
//                answer = "NO"
//                break
//            }
//        }
//    }
//
//    return myStack.isEmpty ? answer : "NO"
//}
