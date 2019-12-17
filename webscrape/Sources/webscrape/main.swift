import Foundation
import SwiftSoup

var QuotesDictionary: [String: [[String: Any]]] = [:]

func scrapeHistoryQuotes() -> [[String: Any]] {
    var dict: [[String: Any]] = []
    let myStrKey = "https://wisdomquotes.com/history-quotes/"
    let url = URL(string: "https://wisdomquotes.com/history-quotes/")!

    if let historystr = UserDefaults.standard.string(forKey: myStrKey) {
        let doc  = try! SwiftSoup.parse(historystr)
        let quoteElements = try! doc.select("blockquote")
        
        for i in 0..<quoteElements.count {
            
            do {
                
                let str = try quoteElements[i].text()
                let quoteAndAuth = str.split(separator: ".")
                
                let body = String(quoteAndAuth[0])
                
                dict.append([
                    "body": body,
                    "author": quoteAndAuth.count >= 2 ? String(quoteAndAuth[1]) : "",
                    "tags": ["history"]
                ])
                
            } catch {
                NSLog("Error: \(error)")
            }
        }
    } else {
        
        let data = try! Data(contentsOf: url)
        let str = String(data: data, encoding: .utf8)!
        UserDefaults.standard.set(str, forKey: myStrKey)
    }


    return dict
}

//let historyQuotes = scrapeHistoryQuotes()
//QuotesDictionary["history"] = historyQuotes
//print(QuotesDictionary)


func getAllQuoteLinks() -> [String] {
    var links = [String]()
    let url = URL(string: "https://wisdomquotes.com/")!
    let myStrKey = "wisdomquotesLinks"
    
    if let mainPage = UserDefaults.standard.string(forKey: myStrKey) {
        do{
            let doc = try SwiftSoup.parse(mainPage)
            let quoteLinks = try doc.select("a")
//            print(quoteLinks[10])
//            let x = try quoteLinks[10].attr("href", true)
//            print(x)
            
            for i in 10..<quoteLinks.count - 9 {
                
                var str = try quoteLinks[i].text()
                str = str.replacingOccurrences(of: " ", with: "-")
                str += "-quotes"
                links.append("https://wisdomquotes.com/" + str.lowercased())
            }
            
        } catch {
            NSLog("Error: \(error)")
        }
    } else {
        let data = try! Data(contentsOf: url)
        let str = String(data: data, encoding: .utf8)
        UserDefaults.standard.set(str, forKey: myStrKey)
    }
    
    return links
}


_ = getAllQuoteLinks().map { print($0) }
