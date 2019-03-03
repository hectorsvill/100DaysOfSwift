//https://github.com/raywenderlich/swift-algorithm-club

import UIKit

////////////////////////////////////////////////////////////////////////////////
//Stack - You can only push to add a new element to the top of the stack, pop to remove the element from the top, and peek at the top element without popping it off.

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


var stacks = Stack(array: [])
stacks.isEmpty
stacks.push("A")
stacks.push("H")
stacks.push("df")
stacks.push("Q")
stacks.push(2)
print(stacks)
stacks.pop()
print(stacks)
