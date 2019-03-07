//https://github.com/raywenderlich/swift-algorithm-club

import UIKit

////////////////////////////////////////////////////////////////////////////////
//Stack - You can only push to add a new element to the top of the stack, pop to remove the element from the top, and peek at the top element without popping it off. LIFO

public struct Stack<T> {
	fileprivate var array = [T]()
	
	public var isEmpty: Bool{
		return array.isEmpty
	}
	
	public var count: Int {
		return array.count
	}
	
	public mutating func push(_ element: T) {
		array.append(element)
	}
	
	public mutating func pop() -> T? {
		return array.popLast()
	}
	
	public var top: T? {
		return array.last
	}
}

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
//Queue -A queue is a list where you can only insert new items at the back and remove items from the front. FIFO
public struct Queue<T> {
	fileprivate var array = [T] ()

	public var isEmpty: Bool {
		return array.isEmpty
	}
	
	public var count: Int {
		return array.count
	}
	
	public mutating func enqueue(_ element: T){
		array.append(element)
	}
	
	public  mutating func dequeue() -> T? {
		if isEmpty{
			return nil
		} else {
			return array.removeFirst()
		}
	}
	
	public var front: T? {
		return array.first
	}
}

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
//Insertion Sort

var numarr = [Int]()

for _ in 0...10 {
	numarr.append(Int.random(in: 3...91))
}
print(numarr)

func InsertionSort(_ arr: [Int]) -> [Int] {

	var a = arr
	for x in 1..<a.count {
		var y = x
		while a[y] < a[y - 1] && y > 0 {
			a.swapAt(y - 1 , y)
			y -= 1
			print("\(y) \(a)")
		}
		
	}
	
	return a
}

print(InsertionSort(numarr))

