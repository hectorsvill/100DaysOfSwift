class Solution {
    
    private func isEvenNumberOfDigits(_ n: Int) -> Bool{
        var digitCount = 0
        var cp = n
        while (cp > 0 ){
            digitCount += 1
            cp /= 10
        }
        
        
        return digitCount % 2 == 0
    }
    
    func findNumbers(_ nums: [Int]) -> Int {
        var evenNumbers = 0
        
        for n in nums {
            if (isEvenNumberOfDigits(n)) {
                evenNumbers += 1
            }
        }
        
        return evenNumbers
    }
}


let s = Solution()

s.findNumbers([1,22,333,4444,55555])
