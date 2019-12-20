import Foundation

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

let f = fib(12)
print(f)
