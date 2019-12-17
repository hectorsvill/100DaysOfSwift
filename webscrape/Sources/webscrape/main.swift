import Foundation
import SwiftSoup

var QuotesDictionary: [String: [[String: Any]]] = [:]

func scrapeQuotes(html: String ) -> [[String: Any]] {
    let doc  = try! SwiftSoup.parse(html)
    let quoteElements = try! doc.select("blockquote")
    var quotes: [[String: Any]] = []
    
    for i in 0..<quoteElements.count {
        do {
            let str = try quoteElements[i].text()
            let quoteAndAuth = str.split(separator: ".")
            
            let body = String(quoteAndAuth[0])
            let author = quoteAndAuth.count >= 2 ? String(quoteAndAuth[1]) : ""
            var tags = ["history"]
            
            if !author.isEmpty {
                tags.append(author)
            }
            
            quotes.append(["body": body, "author": author, "tags": tags])
        } catch {
            NSLog("Error: \(error)")
        }
    }
    
    return quotes
}



func getAllQuoteLinks() -> [String: URL] {
    var links: [String: URL] = [:]
    let url = URL(string: "https://wisdomquotes.com/")!
    let myStrKey = "wisdomquotesLinks"
    
    if let mainPage = UserDefaults.standard.string(forKey: myStrKey) {
        do{
            let doc = try SwiftSoup.parse(mainPage)
            let quoteLinks = try doc.select("a")
            
            for i in 11..<quoteLinks.count - 9 {
                let key = try quoteLinks[i].text()
                let strKey = key.replacingOccurrences(of: " ", with: "-")
                let urlStr = "https://wisdomquotes.com/" + strKey.lowercased() + "-quotes"
                links[strKey] = URL(string: urlStr)!
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
    
    for (k, v) in quoteLinks {
        do {
            let data = try Data(contentsOf: v)
            let html = String(data: data, encoding: .utf8)!
            QuotesDictionary[k] = scrapeQuotes(html: html)
        } catch {
            NSLog("Error: \(error)")
        }
        
        break
    }
}


//print(QuotesDictionary)

createQuoteDict()
//print(QuotesDictionary)


let fm = FileManager()

if #available(OSX 10.12, *) {
    let dir = try! fm.url(for: .desktopDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
    let newPath = "\(dir.path)/Quotes.json"
    print(newPath)
    let jsonData = try! JSONSerialization.data(withJSONObject: QuotesDictionary, options: .prettyPrinted)
    fm.createFile(atPath: newPath, contents: jsonData, attributes: nil)
    print(jsonData)
    
} else {
    // Fallback on earlier versions
}

