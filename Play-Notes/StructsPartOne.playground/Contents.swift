//https://www.hackingwithswift.com/100/8
import UIKit
//structs part one

//computed properties
struct user {
    var name: String
    var race: String //will be return from createRace method directly after user
    var giant: Bool
    {
        didSet { // didSet - swift prints a message when var giant is changed
            print("\(name) has changed their stats")}
        
    }
    
    var isGiant: String
    {
        if !giant
        {
            return "\(name) only Giants play"
        }
        else
        {
            return "\(name) You are not a Giant "
        }
    }
    //mutating method -- to change property inside a method use mutating keyword
    mutating func createRace () -> String? {
        var races = ["ark", "boar", "elf", "clone"]
        races.append(race)
        for r in races {print("\(r)")}
        race = races.randomElement() ?? "nil"
        return race // must be unwraped before return
    }
   
}

var getUser = user(name: "oka", race: "human", giant: false)
print(getUser.giant)
getUser.name = "one"
getUser.giant = false // when struct is changed didSet provides a message
getUser.createRace()
print(getUser.race)
print(getUser.race.sorted())
