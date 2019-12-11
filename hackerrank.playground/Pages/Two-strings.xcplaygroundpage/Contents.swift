import Foundation

// Complete the twoStrings function below.
func twoStrings(s1: String, s2: String) -> String {

    var s1_d: [String: Int] = [:]
    var s2_d: [String: Int] = [:]

    var s3 = ""

    let x = s1_d.sorted(by: )
    print(x.key)
    
    _ = s1.map { s1_d[String($0), default: 0] += 1 }
    _ = s2.map { s2_d[String($0), default: 0] += 1 }

    for (k,v) in s1_d {
        if s2_d[k] != nil {
            let count = (v + s2_d[k]! ) / 2
            s1_d[k]!     -= 1
            for _ in 0..<count {
                s3 += k
            }
        }
    }

    print(s3)
    // print(s1_d, s2_d)
    return s3 != "" ? "YES" : "NO"
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let q = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

for qItr in 1...q {
    guard let s1 = readLine() else { fatalError("Bad input") }

    guard let s2 = readLine() else { fatalError("Bad input") }

    let result = twoStrings(s1: s1, s2: s2)

    fileHandle.write(result.data(using: .utf8)!)
    fileHandle.write("\n".data(using: .utf8)!)
}
