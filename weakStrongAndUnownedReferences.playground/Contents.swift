import UIKit

//class Rapper {
//	func playTrack(){
//		print("Shimmy shimmy ya")
//	}
//}


/*
func rap() -> () -> Void
Declared In
weakStrongAndUnownedReferences.playground
*/
//func rap() -> () -> Void {
//	let methodman = Rapper()
//
////	let rapping = { [weak methodman] in
////		methodman!.playTrack()
////		return
////	}
//
//	let rapping = { [unowned methodman] in
//		methodman.playTrack()
//	}
//
//	return rapping
//}

//let rapFunc = rap()
//rapFunc()


//writeToLog { [weak self] user, message in
//	self?.addToLog("\(user) triggered event: \(message)")
//}


//copies of closures
//var count = 0
//
//let countprint = {
//	count += 1
//	print("The count is \(count)")
//}
//countprint()
//countprint()


//closures

func filterGraterThenValue(value: Int, nums: [Int]) -> [Int]
{
	var new = [Int]()
	
	for n in nums{
		if n > value{
			new.append(n)
		}
	}
	
	return new
}

//let nums = Array([1...10])
//let filtered = filterGraterThenValue(value: 4, nums: [1,2,32,11,3,5,44,4])
//print(filtered)

func filterWithPredicateClosure(closure: (Int) -> Bool, nums: [Int]) -> [Int] {
	var filtered = [Int]()
	
	for n in nums {
		if closure(n){
			filtered.append(n)
		}
	}
	return filtered
}

let filteredList = filterWithPredicateClosure(closure: { (nums) -> Bool in
	return nums > 3
}, nums: [1,2,32,11,3,5,44,4])

func isOdd(num: Int) -> Bool{
	return num % 2 != 0
}

let filteredList2  = filterWithPredicateClosure(closure: isOdd, nums: [1,2,32,11,3,5,44,4])


print(filteredList2)













