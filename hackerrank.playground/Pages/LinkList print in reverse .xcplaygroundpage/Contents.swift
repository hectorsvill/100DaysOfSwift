//: [Previous](@previous)


//https://www.hackerrank.com/challenges/print-the-elements-of-a-linked-list-in-reverse/problem?h_r=next-challenge&h_v=zen
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

var s: SinglyLinkedListNode? = SinglyLinkedListNode(data: 0)

for i in 1...5 {
    addNode(head: s, i)
}



func reversePrint(llist head: SinglyLinkedListNode?) -> SinglyLinkedListNode? {
    var h = head
    var prev: SinglyLinkedListNode? = nil
    
    while h != nil {
        let next = h?.next
        h?.next = prev
        prev = h
        h = next
    }
    
//    while p != nil {
//        print(p!.data)
//        p = p?.next
//    }
    return prev
}

printLL(head: s)
let reverse = reversePrint(llist: s)
printLL(head: reverse)
