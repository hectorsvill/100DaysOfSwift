

import Foundation

var strCount = Int(readLine(strippingNewline: true)!)!
var myheap = [String]()

func heap_v1() {
    for _ in 0..<strCount {
        let str = readLine(strippingNewline: true)!
        let arr = str.split(separator: " ")
        if arr[0] == "1" {
            myheap.append(String(arr[1]))
        } else if arr[0] == "2" {
            if let index = myheap.firstIndex(of: String(arr[1])) {
                myheap.remove(at: index)
            }
        } else if arr[0] == "3" {
            let min = myheap.min()!
            print(min)
        }
    }
}

