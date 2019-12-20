//: [Previous](@previous)

import Foundation
import Foundation
class SinglyLinkedListNode {
    var data: Int
    var next: SinglyLinkedListNode? = nil
    
    init(data: Int) {
        self.data = data
    }
}

func addNode(head: SinglyLinkedListNode?, _ data: Int) {
    var h = head
    
    if h == nil {
        h = SinglyLinkedListNode(data: data)
    } else {
        
        while h?.next != nil {
            h = h?.next
        }
        
        h?.next = SinglyLinkedListNode(data: data)
    }
    
    
}

func printLL(head: SinglyLinkedListNode?) {
    var h = head
    while h != nil {
        print(h!.data, terminator: " ")
        h = h?.next
    }
    print("")
}

func deleteNode(llist head: SinglyLinkedListNode?, position: Int) -> SinglyLinkedListNode? {
    var h = head
    var prev: SinglyLinkedListNode? = nil

    if position == 0 {
        return head!.next
    }

    var i = 0
    while h?.next != nil {
        
        if i == position {
//            print(h!.data, terminator: " ")
            break
        } else {
            prev = h
            h = h?.next
        }
        i += 1
    }

    prev!.next = h!.next

    return head
}











func llistCount(head: SinglyLinkedListNode?) -> Int {
    var h = head
    var i = 0
    while h != nil {
        i += 1
        h = h!.next
    }
    return i
}

func removeKthLinkedListNode(head: SinglyLinkedListNode?, k: Int) -> SinglyLinkedListNode? {
    // Write your code here
    let count = llistCount(head: head) - k
    print(count)
    if count  == 0{
        
    }

    var h = head
    var prev: SinglyLinkedListNode? = nil
    var i = 0

    while h != nil {
        if i == count {
            print(h!.data)
            break
        }
        
        i += 1
        prev = h
        h = h?.next
    }

    prev?.next = h?.next
    return head
}

//var s: SinglyLinkedListNode? = SinglyLinkedListNode(data: 0)
//
//for i in 1...1 {
//    addNode(head: s, i)
//}
//
//
//
//printLL(head: removeKthLinkedListNode(head: s, k: 2))


func threeNumberSum(arr: [Int], target: Int) -> [[Int]] {
    // Write your code here
    var triplets = [[Int]]()
    let arrCount = arr.count
    for x in 0..<arrCount - 2 {
        for y in x + 1..<arrCount - 1 {
            for z in y + 1..<arrCount {
                let sum = [arr[x], arr[y],arr[z]].reduce(0, +)
                if sum == target {
                    let t = [arr[x],arr[y],arr[z]].sorted()
                     triplets.append(t)
//                    print(x,y,z)
                }
                
            }

        }
    }

     
    return triplets
}

print(threeNumberSum(arr: [12, 3, 1, 2, -6, 5, 0, -8, -1, 6, -5], target: 0))
