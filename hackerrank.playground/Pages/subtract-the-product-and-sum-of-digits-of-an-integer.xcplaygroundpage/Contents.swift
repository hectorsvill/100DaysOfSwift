
// https://leetcode.com/problems/subtract-the-product-and-sum-of-digits-of-an-integer/

class Solution {
    func subtractProductAndSum(_ n: Int) -> Int {
        var cp = n
        var products = [Int]()
        
        while (cp > 0) {
            let product = cp % 10
            products.insert(product, at: 0)
            cp /= 10
        }

        let product = products.reduce(1, *)
        let sum = products.reduce(0, +)
        return  product - sum
    }
}

let s = Solution()
s.subtractProductAndSum(234)
