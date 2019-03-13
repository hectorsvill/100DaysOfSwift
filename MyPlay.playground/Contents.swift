import UIKit


//var numlist: [Int] = [5, 2, -17, -8, 4, 10, -9, 3]
//
//
//func findHigh(nums: [Int]) -> Int?
//{
//	var high: Int?
//
//	high = numlist[0]
//	for n in nums
//	{
//		if n > high!
//		{
//			high = n
//		}
//	}
//
//	return high
//}
//
//findHigh(nums: numlist)
//var nums = numlist.sorted()
////print(nums[nums.count - 1])
//
//var word = "rrun"
//var ogword = "running"
//
//for l in word {
//	if let p = ogword.firstIndex(of: l){
//		print(ogword)
//		ogword.remove(at: p)
//	}
//}


//let str = "a A"
//let strArr = Array(str)
//
//for i in str.utf8 {
//	print("\(i):()")
//}
//let x = UnicodeScalar(97)!
//print(x)


for i in 97..<97+26 {
	print(UnicodeScalar(i)!, terminator: " ")
}
