import Foundation
import SwiftSoup



let myStrKey = "https://wisdomquotes.com/history-quotes/"
let url = URL(string: "https://wisdomquotes.com/history-quotes/")!

if let historystr = UserDefaults.standard.string(forKey: myStrKey) {
    let doc  = try! SwiftSoup.parse(historystr)
    let quoteElements = try! doc.select("blockquote")
    
    var dict: [String: [[String: String]]] = ["history": []]
    for i in 0...10 {
        var d: [String: String] = [:]
        
        let str = try quoteElements[i].text()
        let quoteAndAuth = str.split(separator: ".")
        
        let body = String(quoteAndAuth[0])
        d["body"] = body
        if quoteAndAuth.count >= 2 {
            d["author"] = String(quoteAndAuth[1])
        }
        dict["history"]?.append(d)
//        print(d)
    }
    print(dict)
    
} else {
    
    let data = try! Data(contentsOf: url)
    let str = String(data: data, encoding: .utf8)!
    UserDefaults.standard.set(str, forKey: myStrKey)
}



