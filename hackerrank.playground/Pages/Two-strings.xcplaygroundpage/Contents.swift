import Foundation

// Complete the twoStrings function below.
func twoStrings(s1: String, s2: String) -> String {

    var s1_d: [String: Int] = [:]
    var s2_d: [String: Int] = [:]

    var s3 = ""
    
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
