import UIKit


var numlist: [Int] = [5, 2, -17, -8, 4, 10, -9, 3]


func findHigh(nums: [Int]) -> Int?
{
	var high: Int?
	
	high = numlist[0]
	for n in nums
	{
		if n > high!
		{
			high = n
		}
	}

	return high
}

findHigh(nums: numlist)
var nums = numlist.sorted()
print(nums[nums.count - 1])
