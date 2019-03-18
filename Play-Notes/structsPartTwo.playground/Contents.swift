import UIKit
//https://www.hackingwithswift.com/100/9
//structs part two

struct UserData {
    init () {print("User Data")}
}

struct User {
    static var userCount = 0 // static property is shared
    var userName: String
    
    lazy var data = UserData() // lazy property - struct is only created if initialized
    
    //initializer
    init (userName: String) {
        self.userName = userName //self.name refers to the property
        print("user \(userName) was created!")
        User.userCount += 1
    }
    
}

var newUser = User(userName: "hvilla")
newUser.data
var newUser1 = User(userName: "llll")
newUser.data

print(User.userCount)
