

// https://leetcode.com/problems/split-a-string-in-balanced-strings/

class Solution {
    func balancedStringSplit(_ s: String) -> Int {
        var splitCount = 0
        var rCount = 0
        var lCount = 0
        
        for c in s {
            c == "R" ? (rCount += 1) : (lCount += 1)
            
            if rCount == lCount {
                splitCount += 1
                rCount = 0
                lCount = 0
            }
        }
        return splitCount
    }
}

let s = Solution()
s.balancedStringSplit("RLRRLLRLRL")
