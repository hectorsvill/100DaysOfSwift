//: [Previous](@previous)

import Foundation


func partitionArray(k: Int, numbers: [Int]) -> String {
    
    var nums_dict: [Int: Int] = [:]
    _ = numbers.map { nums_dict[Int($0), default: 0] += 1 }
    
    var sortedList = nums_dict.sorted  { $0.value > $1.value }.map { $0.key }
    
    
    while sortedList.count > k - 1{
        print(sortedList)
        print(nums_dict)
        
        var key = 0
        for count in 0..<k {
            key = sortedList[count]
            nums_dict[key]! -= 1
        }
        for count in 0..<k {
            key = sortedList[count]
            if nums_dict[key]! <= 0 {
                nums_dict.removeValue(forKey: key)
                let index = sortedList.firstIndex(of: key)!
                sortedList.remove(at: index)
            }
        }
        
        

//        brea```k
    }
    
    
    return "Yes"
}



//print(partitionArray(k: 2, numbers: [3,5,3,2])) // [3,5] , [3,2]
print(partitionArray(k: 2, numbers: [1,2,1,4]))

//: [Next](@next)
