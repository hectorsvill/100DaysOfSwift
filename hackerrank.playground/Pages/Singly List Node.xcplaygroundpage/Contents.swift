//: [Previous](@previous)

import Foundation


//  Singly-linked lists are already defined with this interface:

public class ListNode<T> {
    public var value: T
    public var next: ListNode<T>?
    
    public init(_ x: T) {
        self.value = x
        self.next = nil
    }
}

func removeKFromList(l: ListNode<Int>?, k: Int) -> ListNode<Int>? {
    var l = l
    var copy = l
    var last: ListNode<Int>? = nil
    
    while copy?.value == k {
        l = copy?.next
        copy = l
    }
    
    while copy != nil {
        while copy != nil && copy?.value != k {
            last = copy
            copy = copy?.next
        }
        
        if copy == nil {
            return l
        }
        
        last?.next = copy?.next
        copy = last?.next
        
    }
    
    return l
}


var nodes: [ListNode<Int>] = []

for l in [0,1,2,3,0,1,] {
    let node = ListNode<Int>(l)
    nodes.append(node)
}

var list :ListNode<Int>! = nodes[0]
list.next = nodes[1]
nodes[1].next = nodes[2]
nodes[2].next = nodes[3]
nodes[3].next = nodes[4]
nodes[4].next = nodes[5]

var l = removeKFromList(l: list, k: 0)

while l != nil {
    print(l?.value)
    l = l?.next
}
