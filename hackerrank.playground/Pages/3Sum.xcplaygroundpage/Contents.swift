//: [Previous](@previous)

import Foundation
//https://www.geeksforgeeks.org/find-a-triplet-that-sum-to-a-given-value/

// 0(n^3)
func threeSum_1(_ nums: [Int]) -> [[Int]] {
    var sums_equal_0 = [[Int]]()
    
    for x in 0...nums.count - 2 {
        for y in x + 1..<nums.count - 1 {
            for z in y + 1..<nums.count{
                let values = [nums[x], nums[y], nums[z]].sorted()
                let total = values.reduce(0 , +)
                if total == 0 && !sums_equal_0.contains(values) {
                    sums_equal_0.append(values)
                }
                
            }
        }
    }

    return sums_equal_0
}

func threeSum_2(_ nums: [Int]) -> [[Int]] {
    var equal0 = [[Int]]()
    let nums = nums.sorted()

    for index in 0...nums.count - 2{
        var xIndex = index + 1
        var yIndex = nums.count - 1

        while xIndex < yIndex {
            let values = [nums[index], nums[xIndex], nums[yIndex]]
            let total = values.reduce(0, +)
            
            if total == 0 {
                if !equal0.contains((values)) {
                    equal0.append(values)
                }
                break
            } else if total < 0 {
                xIndex += 1
            } else{
                yIndex -= 1
            }
        }
    }

    return equal0
}

func threeSum_3(_ nums: [Int], value: Int) -> [[Int]] {
    var solution = [[Int]]()
    let nums = nums.sorted()
    
    for index in 0..<nums.count {
        var set = Set<Int>()
        let currentSum = value - nums[index]
        for j in index + 1..<nums.count {
//            print("Index: \(index)", set)
            if set.contains(currentSum - nums[j]) {
                let values = [nums[index], nums[j], currentSum - nums[j]]
                
                if !solution.contains(values) {
                    solution.append(values)
                }
            }
            
            set.insert(nums[j])
        }
        
    }
    
    return solution
}


//let testValue_3000 =
let tests = [
[-1,0,1,2,-1,-4],


]
let v = threeSum_2(tests[0])
print(v)
