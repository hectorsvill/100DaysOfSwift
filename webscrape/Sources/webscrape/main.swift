import Foundation
import SwiftSoup

var dict: [String: [[String: String]]] = [:]

func scrapeHistoryQuotes() -> [[String: String]] {
    var dict: [[String: String]] = []
    let myStrKey = "https://wisdomquotes.com/history-quotes/"
    let url = URL(string: "https://wisdomquotes.com/history-quotes/")!

    if let historystr = UserDefaults.standard.string(forKey: myStrKey) {
        let doc  = try! SwiftSoup.parse(historystr)
        let quoteElements = try! doc.select("blockquote")
        
        for i in 0..<quoteElements.count {
            var d: [String: String] = [:]
            
            if let str = try? quoteElements[i].text() {
                
                let quoteAndAuth = str.split(separator: ".")
                let body = String(quoteAndAuth[0])
                
                d["body"] = body
                d["author"] = quoteAndAuth.count >= 2 ? String(quoteAndAuth[1]) : ""
                
                dict.append(d)
            }
        }
    } else {
        
        let data = try! Data(contentsOf: url)
        let str = String(data: data, encoding: .utf8)!
        UserDefaults.standard.set(str, forKey: myStrKey)
    }


    return dict
}

let historyQuotes = scrapeHistoryQuotes()
dict["history"] = historyQuotes
print(dict)
