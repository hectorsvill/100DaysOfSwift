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
            
            var body = String(quoteAndAuth[0])
            for i in 0..<quoteAndAuth.count - 1 {
                body += String(quoteAndAuth[i]) + "."
            }
            
            var author = String(quoteAndAuth.last!)
            
            if !author.isEmpty {
                let author_arr = author.split(separator: " ")
                var temp = ""
                for str in author_arr {
                    if String(str) == "Click" {
                        break
                    }
                    
                    temp += (String(str) + " ")
                }
                author = temp.trimmingCharacters(in: .whitespaces)
            }
            
            
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

func writeJsonToFile() {

    if #available(OSX 10.12, *) {
        let fm = FileManager()
        let dir = try! fm.url(for: .desktopDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        let newPath = "\(dir.path)/Quotes.json"
        print(newPath)
        let jsonData = try! JSONSerialization.data(withJSONObject: QuotesDictionary, options: .prettyPrinted)
        fm.createFile(atPath: newPath, contents: jsonData, attributes: nil)

    } else {
        // Fallback on earlier versions
    }
}


func createQuoteDict() {
    let quoteLinks = getAllQuoteLinks()
    var i = 0
    for (k, v) in quoteLinks {
        do {
            let data = try Data(contentsOf: v)
            let html = String(data: data, encoding: .utf8)!
            QuotesDictionary[k] = scrapeQuotes(html: html)
        } catch {
            NSLog("Error: \(error)")
        }
        
        i += 1
        
        if i == 2 { break }
        
    }
    
    writeJsonToFile()
}


//print(QuotesDictionary)

createQuoteDict()
//print(QuotesDictionary)




