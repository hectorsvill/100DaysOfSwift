import Foundation
import SwiftSoup


class QuotesDictionaryCreator {
    var QuotesDictionary: [String: [[String: Any]]] = [:]
    
    init () {
        createQuoteDict()
    }
    
    /// Create a dictionary of quotes
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
         }
         
         //    writeJsonToFile()
     }
    
    
    /// get all links to quote from main page
    func getAllQuoteLinks() -> [String: URL] {
        var links: [String: URL] = [:]
        let url = URL(string: "https://wisdomquotes.com/")!
           
        let data = try! Data(contentsOf: url)
        let html = String(data: data, encoding: .utf8)!
        
        do{
            let doc = try SwiftSoup.parse(html)
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
        return links
        
    }
    
    /// Scrape quotes with htmlString
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
    
    /// Write dictionary as jason file on desktop
    func writeJsonToFileOnDesktop(fileName: String = "QuotesLibrary") {
        if #available(OSX 10.12, *) {
            let fm = FileManager()
            let dir = try! fm.url(for: .desktopDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            let newPath = "\(dir.path)/\(fileName).json"
            print(newPath)
            let jsonData = try! JSONSerialization.data(withJSONObject: QuotesDictionary, options: .prettyPrinted)
            fm.createFile(atPath: newPath, contents: jsonData, attributes: nil)
        }
    }
}




QuotesDictionaryCreator()






