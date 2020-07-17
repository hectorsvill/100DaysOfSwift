//: [Previous](@previous)

import Foundation
//https://www.geeksforgeeks.org/find-a-triplet-that-sum-to-a-given-value/
//Given an array and a value, find if there is a triplet in array whose sum is equal to the given value.

// A triplet is list of 3 numbers that represent the index of the number in given list
struct Triplet:Equatable {
    let list: [Int] // indexes
}


// 0(n^3)
//return:
func threeSum_1(_ nums: [Int], target: Int) -> [Triplet] {
    var solution = [Triplet]()
    
    for x in 0...nums.count - 2 {
        for y in x + 1..<nums.count - 1 {
            for z in y + 1..<nums.count{
                let list = [nums[x], nums[y], nums[z]].sorted()
                let total = list.reduce(0 , +)
                let triplet = Triplet(list: [x , y, z])
                if total == target && !solution.contains(triplet) {
                    solution.append(triplet)
                }
            }
        }
    }

    return solution
}





// 0(n^2)
func threeSum_2(_ nums: [Int], target: Int) -> [Triplet] {
    var solution = [Triplet]()
    let nums = nums.sorted()

    for index in 0...nums.count - 2{
        var xIndex = index + 1
        var yIndex = nums.count - 1

        while xIndex < yIndex {
            let list = [nums[index], nums[xIndex], nums[yIndex]]
            let total = list.reduce(0, +)
            let triplet = Triplet(list: [index, xIndex, yIndex])
            if total == target {
                if !solution.contains(triplet) {
                    solution.append(triplet)
                }
                break
            } else if total < 0 {
                xIndex += 1
            } else{
                yIndex -= 1
            }
        }
    }

    return solution
}

func threeSum_3(_ nums: [Int], target: Int) -> [Triplet] {
    var solution = [Triplet]()
    let nums = nums.sorted()
    
    for index in 0..<nums.count {
        var set = Set<Int>()
        let currentSum = target - nums[index]
        for j in index + 1..<nums.count {
            if set.contains(currentSum - nums[j]) {
                
                let values = [nums[index], nums[j], currentSum - nums[j]]
                let triplet = Triplet(list: values)
                
                if !solution.contains(triplet) {
                    solution.append(triplet)
                }
            }
            
            set.insert(nums[j])
        }
    }
    
    return solution
}



let arr1 = [1,2,3,4,5]

let solution = threeSum_3(arr1, target: 9)

solution.forEach{
    print($0.list)
}
