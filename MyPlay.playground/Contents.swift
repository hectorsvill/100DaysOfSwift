import UIKit
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
func find8 (_ nums: inout [Int]) -> Int? {
    if nums.isEmpty {
    return nil
    }
    nums[8] = 8
    return 0
}
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

//let n4 = test1(name: "one2e2") ?? 42 // ?? provide default value - nill coalescing
//
//print(n4)

enum numWeight {
    case zero
    case ten
    case hundred
    case multiplier(multi: Int)
}


struct player {
    var name: String
    var age: Int
    func playerInfo () {
        print("\(name) is of the \(age)")
    }
}

//let hec = player(name: "hvilla", age: 29)
//let mar = player(name: "martiga", age: 29)
//let hecCpy = hec
//
//print(hecCpy)
//hec.playerInfo()


class Player {
    var name: String
    var power: Int
    
    init(name: String, power: Int) {
        self.name = name
        self.power = power
    }
    func display() {
        print("\(name) has a power of \(power)")
    }
}

class Elf: Player {
    override func display() {
        print("Ork of the north \(name) has a power of \(power)")
    }
}

class Ork: Player {
    var noiseLevel: Int
    
    init(name: String, power: Int, noiseLevel: Int) {
        self.noiseLevel = noiseLevel
        super.init(name: name, power: power)
    }
    
    override func display() {
        print("Orks \(name) wants noise level of \(noiseLevel)")
    }
}

//var p1 = Player(name: "baka", power: 100)
//p1.display()
//var p2 = Elf(name: "orn", power: 89)
//p2.display()
//var p3 = Ork(name: "pika", power: 44, noiseLevel: 4)
//p3.display()

//ex - static properties
//struct PlayerOf {
//    static var echo = "You played a game"
//
//    var name: String
//    var age: Int
//}
//let n34 = PlayerOf(name: "hvi", age: 232)


let vw = UIView()
UIView.animate(withDuration: 0.5) {
    vw.alpha = 0
}
