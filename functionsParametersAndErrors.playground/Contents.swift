//functions, parameters, and errors


import UIKit


//writing functions

//func printBio() {
//    let bio = """
//I am StoiczFPV. \
//I fly and build machines.
//This is a function.
//"""
//    print(bio)
//}
//printBio()

//accepting parameters
//func square(number: Int){
//    print("\(number*number)")
//}
//square(number: 5) // state param




//RETURNING VALUE
//func square(num: Double) -> Double {
//    return (num * num)
//}
//let dd = square(num: 45.2574)
//print(dd)




//PARAMETERS LABELS
//func sayHello(to name: String) {
//    print("Hello, \(name)")
//}
//sayHello(to: "Hector")

//OMITTING PARAMETER LABELS
//func greet(_ person: String) {
//    print("hello, \(person)")
//}
//greet("Hector")



//DEFAULT PARAMETERS
//func greet(_ name: String, good: Bool = true){
//    if good == true {
//        print("\(name) is good!")
//    }else{
//        print("\(name) is bad!")
//    }
//}
//
//greet("hector".uppercased())
//greet("Tom".uppercased(), good: false)



//VARIADIC FUNTIONS -- function of indefinite arity
    //ex print()
//print("Hector", "\tVillasano", "\nSteven")
//    //square() function that can accept any number of Int var
//func squareMany(numbers: Int...){
//    for num in numbers {
//        print("\(num) * \(num) == \(num*num)")
//    }
//}
//squareMany(numbers: 5, 10, 15, 232, 122, 36)



//WRITING THROWING FUNCTION
//enum PasswordError: Error {
//    case obvious
//    case ok
//}
//func checkPassword(_ password: String) throws -> Bool {
//
//    if password == "password" {
//        throw PasswordError.obvious
//    }
//
//    return true
//}



//RUNNING THROWING FUNCTIONS
//let pw = "pass"
//do {
//    try checkPassword(pw)
//    print("Good password: ")
//} catch {
//    print("You can't use that password:")
//}


//inout parameters -- swap two ints

var swap = (a: 0, b: 0)
swap.a = 10
swap.b = 20

//print("\(swap.a)")

func swapTwoInts (_ a: inout Int, _ b: inout Int){
    let aTemp = a
    a = b
    b = aTemp
}

swapTwoInts(&swap.a, &swap.b)
print("a = \(swap.a)\n b = \(swap.b)")
