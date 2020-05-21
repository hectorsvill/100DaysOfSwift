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

