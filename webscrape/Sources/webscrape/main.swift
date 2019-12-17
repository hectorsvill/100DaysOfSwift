import Foundation
import SwiftSoup

var QuotesDictionary: [String: [[String: Any]]] = [:]

func scrapeHistoryQuotes() -> [[String: Any]] {
    var quotes: [[String: Any]] = []
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
                
                quotes.append([
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


    return quotes
}

//let historyQuotes = scrapeHistoryQuotes()
//QuotesDictionary["history"] = historyQuotes
//print(QuotesDictionary)


func getAllQuoteLinks() -> [String: URL] {
    var links: [String: URL] = [:]
    let url = URL(string: "https://wisdomquotes.com/")!
    let myStrKey = "wisdomquotesLinks"
    
    if let mainPage = UserDefaults.standard.string(forKey: myStrKey) {
        do{
            let doc = try SwiftSoup.parse(mainPage)
            let quoteLinks = try doc.select("a")
            for i in 11..<quoteLinks.count - 9 {
                
                var key = try quoteLinks[i].text()
                let str = key.replacingOccurrences(of: " ", with: "-")
                let urlStr = "https://wisdomquotes.com/" + str.lowercased() + "-quotes"
                links[key] = URL(string: urlStr)!
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




func createQuoteDict() {

    let quoteLinks = getAllQuoteLinks()
    
    for quoteLink in quoteLinks {
        print(quoteLink)
//        let data = try! Data(contentsOf: quoteLink)
//        pri1nt(data)
            
        break
    }
    
    
    
    
    
}



createQuoteDict()
