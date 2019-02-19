//external parameters
//
//func getStrCount(in str: String) {
//    print("\(str) : \(str.count)")
//}
//getStrCount(in: "<#T##String#>")





////optionals
//func getName1 (_ name: String) -> String? {
//    if name.isEmpty {
//        return nil
//    }else{
//        return name
//    }
//}
//getName1("one")

//optional is used to hold nil
//https://developer.apple.com/documentation/swift/optional
//https://developer.apple.com/documentation/swift/array
//let shortOpt: Int? = Int("42")
//let longOpt: Optional<Int> = Int("42")
//let noOpt: Int? = Optional.none
//
//func find8 (_ nums: inout [Int]) -> Int? {
//    if nums.isEmpty {
//    return nil
//    }
//    nums[8] = 8
//    return 0
//}
//var nums: [Int] = []
//nums.append(1)
//nums.append(1)
//nums.append(8)
//var repArr: [Int] = Array(repeating: 100, count: 10)
//var eight: Int?
//eight = find8(&repArr)
//print(repArr)

func test1(name: String) -> Int? {
    if name == "sec" { return 121 }
    if name == "secret" { return 122}
    if name == "one" {return 123}
    return nil
}

//var n1 = test1(name: "sec")! //force unwrap with "!"
//print(n1)

//var n2 = test1(name: "secret")
//
//if n2 == nil {
//    print("error")
//} else {
//    print("\(n2!) is the number!") // unwrap optional
//}




//var n3 = test1(name: "sec") //force unwrap with "!"
//print(n3!)

let n4 = test1(name: "one2e2") ?? 42 // ?? provide default value - nill coalescing

print(n4)
