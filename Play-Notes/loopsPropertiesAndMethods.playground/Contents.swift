import UIKit

//let count = 1...10
//
//for n in count {
//    print("Number is \(n)")
//}
//
//for _ in 1...6{
//    print("ho")
//}
//

//var num = 1
//
//while num <= 15 {
//    print(num)
//    num += 1
//}

//repeat loops
//
//while false { //will never run
//    print(false)
//}


//repeat{
//    print(false)
//
//}while false // will atleast run ones


//exiting loops

//var nums = 10
//
//while nums > 0 {
//    print("\(nums) is the number!")
//
//    if (nums == 4)
//    {
//        print("found 4. Goodbuy!")
//        break
//    }
//
//    nums -= 1;
//}


//exiting multiple loops
//outerLoop: for x in 1...10 {
//
//
//    for y in 1...10 {
//
//        let product  = x * y
//        print("[\(x)][\(y)] = \(product)")
//
//        if product == 40 {
//            print("found the product 43")
//            break outerLoop
//        }
//    }
//}

//skipping items
for i in 1...20 {
    if i % 2 != 0 {
        continue // print even and continue
    }
    print(i)
}


