////: [Previous](@previous)
//
import Foundation
////
////import Foundation
////
////
////
/////*
//// * Complete the 'partitionArray' function below.
//// *
//// * The function is expected to return a STRING.
//// * The function accepts following parameters:
//// *  1. INTEGER k
//// *  2. INTEGER_ARRAY numbers
//// */
////
////
////
////
////
//
//let x = 1
//func partitionArray(k: Int, numbers: [Int]) -> String {
//    // Write your code here
//
//    var nums_hash: [Int: Int] = [:]
//    _ = numbers.map { nums_hash[Int($0), default: 0] += 1 }
//    let nums_hash_sorted = nums_hash.sorted { $0.value > $1.value }.map { $0.key }
//
//    print(nums_hash_sorted)
////    while nums_hash.count >= k {
////        for i in 0...k {
////         nums_hash[nums_hash_sorted[i]]! += 1
////         if nums_hash[nums_hash_sorted[i]]! >= 0 {
////             nums_hash[nums_hash_sorted[i]] = nil
////         }
////            print(nums_hash)
////        }
//////        print(nums_hash_sorted, nums_hash_sorted[i])
////
////    }
//
//        while nums_hash_sorted.count > k {
//            for i in 0..<k {
//                if nums_hash[nums_hash_sorted[i]] != nil {
//                    nums_hash[nums_hash_sorted[i]]! -= 1
//                    if nums_hash[nums_hash_sorted[i]]! == 0 {
//                        print("here")
////                        _ = nums_hash_sorted.remove(at: i)
//                        nums_hash.removeValue(forKey: nums_hash_sorted[i])
//                    }
//                } else {
//                    break
//                }
//            }
//
//    }
//    return nums_hash.isEmpty ? "Yes" : "No"
// }
//
//
//
////    while nums_hash_sorted.count > k {
////        for i in 0..<k {
////            if nums_hash[nums_hash_sorted[i]] != nil {
////                nums_hash[nums_hash_sorted[i]]! -= 1
////
////                if nums_hash[nums_hash_sorted[i]]! == 0 {
////                    print("here")
////                    //                _ = nums_hash_sorted.remove(at: i)
////                    nums_hash.removeValue(forKey: nums_hash_sorted[i])
////                }
////
////            } else {
////                break
////            }
////            print(nums_hash)
////            print(nums_hash_sorted, nums_hash_sorted[i])
////
////        }
//
//
//
////    }
//
//
////    print("\n\n", nums_hash)
////
////    return nums_hash.isEmpty ? "Yes" : "No"
////}

//
//func partitionArray(k: Int, numbers: [Int]) -> String {
//    // Write your code here
//
//    var nums_hash: [Int: Int] = [:]
//    _ = numbers.map { nums_hash[Int($0), default: 0] += 1 }
//    var nums_hash_sorted = nums_hash.sorted { $0.value > $1.value }.map { $0.key }
//
////    print(nums_hash_sorted)
//
//    while nums_hash_sorted.count  > k {
//        for i in 0..<k {
//            print(nums_hash_sorted[i])
//            nums_hash[nums_hash_sorted[i]]! -= 1
//
//
//            if nums_hash[nums_hash_sorted[i]]! == 0 {
//                print("delete")
//                let index = nums_hash_sorted.firstIndex(of: nums_hash_sorted[i])
////                print("remove at index \(index)")
//                nums_hash.removeValue(forKey:  nums_hash[nums_hash_sorted[i]]!)
//                nums_hash_sorted.remove(at: index!)
//            }
////            print(nums_hash, nums_hash_sorted)
//        }
//
//
//
//    }
//
//
//    print("\n\n", nums_hash)
//
//    return nums_hash.isEmpty ? "Yes" : "No"
//}
//
//print(partitionArray(k: 2, numbers: [3,5,3,2]))

//
//
//
////: [Next](@next)









//array patitioning


//func reverse(str: String) -> String {
//
//
//    return ""
//}
//
//print(reverse(str: "foo(bar)"))

var x = [2,1,3]
x = x.sorted()
print(x)






