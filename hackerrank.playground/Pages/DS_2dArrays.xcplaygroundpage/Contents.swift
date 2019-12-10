//: [Previous](@previous)

import Foundation

// Complete the hourglassSum function below.
func hourglassSum(arr: [[Int]]) -> Int {

    var values: [Int] = []

    for x in 0...3 {
        for y in 0...3 {
            let value = arr[x][y] + arr[x][y + 1] + arr[x][y + 2] +
                        arr[x + 1][y + 1] +
                        arr[x + 2][y] + arr[x + 2][y + 1] + arr[x + 2][y + 2]
            values.append(value)
        }
    }
    print(values)
    return values.max()!
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

let arr: [[Int]] = AnyIterator{ readLine() }.prefix(6).map {
    let arrRow: [Int] = $0.split(separator: " ").map {
        if let arrItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
            return arrItem
        } else { fatalError("Bad input") }
    }

    guard arrRow.count == 6 else { fatalError("Bad input") }

    return arrRow
}

guard arr.count == 6 else { fatalError("Bad input") }

let result = hourglassSum(arr: arr)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)


//: [Next](@next)
