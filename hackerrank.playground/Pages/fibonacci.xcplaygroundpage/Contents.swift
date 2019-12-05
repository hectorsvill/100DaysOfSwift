import UIKit








// O(n)
func fib(_ n: Int) -> [Int]{
    var f: [Int] = [0]
    var a = 0
    var b = 1
    for _ in 0..<n {
        print("a:\(a)  b:\(b)")
        let temp = a
        a = b
        f.append(a)
        b = temp + b
    }
    
    return f
}

// O(n^2)
//func fibs(_ n: Int) -> [Int] {
//    var fibs: [Int] = []
//    for i in 0..<n {
//        let f = fib(i)
//        fibs.append(f)
//    }
//    return fibs
//}
let f = fib(12)
print(f)
//for f it
