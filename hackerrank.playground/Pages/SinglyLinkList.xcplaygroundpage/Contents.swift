import Foundation
import XCTest

class Node {
    var value: Int
    var next: Node?
    
    init (value: Int, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

class LinkList {
    var head: Node? = nil
    var last: Node? = nil
    
    func insert_at_head(_ value: Int) {
        let node = Node(value: value)
        node.next = head
        head = node
    }
    
    func insert_at_tail(_ value: Int) {
        let node = Node(value: value)
        
        if head == nil {
            head = node
            last = head
        }else {
            last!.next = node
            last = node
        }
    }
    
//    func remove_at_tail() -> Node? {
//        var h = head
//        var n: Node
//        while h != nil{
//            h = h!.next
//        }
//
//        n = h!
//        h = nil
//        return n
//    }
//
    
    
    
    
    func printLL() -> [Int]{
        var arr = [Int]()
        var h = head
        
        while h != nil {
            arr.append(h!.value)
            h = h!.next
        }
        
        return arr
    }
}


var l = LinkList()


l.insert_at_head(10)
l.insert_at_head(11)
l.insert_at_head(12)
l.insert_at_head(13)
l.insert_at_head(14)
var llList = l.printLL()
XCTAssertEqual(llList, [14, 13, 12, 11, 10])

//
//l.insert_at_tail(10)
//l.insert_at_tail(11)
//l.insert_at_tail(12)
//l.insert_at_tail(13)

//llList = l.printLL()

//XCTAssertEqual(llList, [10, 11, 12, 13])

//l.remove_at_tail()
//llList = l.printLL()

//XCTAssertEqual(llList, [10, 11, 12])

