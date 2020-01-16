

// https://leetcode.com/problems/split-a-string-in-balanced-strings/

class Solution {
    
//    init () {
//        print(balancedStringSplit("RLRRLLRLRL"))
//    }
    
    func balancedStringSplit(_ s: String) -> Int {
        var splitCount = 0
        var rCount = 0
        var lCount = 0
        
        for c in s {
            if c == "R" {
                rCount += 1
            } else if c == "L" {
                lCount += 1
            }
            
            if rCount == lCount {
                splitCount += 1
                rCount = 0
                lCount = 0
            }
            
            print(c)
        }
        return splitCount
    }
}

let s = Solution()
s.balancedStringSplit("RLRRLLRLRL")
