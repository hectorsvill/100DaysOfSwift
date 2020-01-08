

// Complete the insertNodeAtPosition function below.

/*
 * For your reference:
 *
 * SinglyLinkedListNode {
 *     data: Int
 *     next: SinglyLinkedListNode?
 * }
 *
 */
func insertNodeAtPosition(llist head: SinglyLinkedListNode?, data: Int, position: Int) -> SinglyLinkedListNode? {
    let node = SinglyLinkedListNode(nodeData: data)
    var headCopy = head
    var prev: SinglyLinkedListNode? = nil

    if position == 0 {
        node.next = head
        return node
    } else {

        var index = 0
        while headCopy != nil {
            if index == position {
                break
            }

            prev = headCopy
            headCopy = headCopy?.next
            index += 1
        }
        // print("prev:",prev!.data)
        // print("head:", headCopy!.data)
        
        prev?.next = node
        node.next = headCopy

    }


    return head
}


