import Foundation

// O(n)
func fib(_ n: Int) -> [uint64]{
    var f: [uint64] = [0]
    var a: uint64 = 0
    var b: uint64 = 1

    for _ in 0..<n {
        let temp = a
        a = b
        f.append(uint64(a))
        b = temp + b
    }
    
    return f
}

let f = fib(92)

f.map {
    print($0)
}

