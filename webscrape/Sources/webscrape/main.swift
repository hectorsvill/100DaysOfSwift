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
    
    for (k, v) in quoteLinks {
        do {
            let data = try Data(contentsOf: v)
            let html = String(data: data, encoding: .utf8)!
            QuotesDictionary[k] = scrapeQuotes(html: html)
        } catch {
            NSLog("Error: \(error)")
        }
        
    
    }
    
    writeJsonToFile()
}


//print(QuotesDictionary)

createQuoteDict()
//print(QuotesDictionary)




/* missed urls

 UserInfo={NSURL=https://wisdomquotes.com/benjamin-franklin-quotes}
 2019-12-17 10:25:25.385552-0800 webscrape[21420:1832592] Error: Error Domain=NSCocoaErrorDomain Code=256 "The file “dreams-quotes” couldn’t be opened." UserInfo={NSURL=https://wisdomquotes.com/dreams-quotes}
 2019-12-17 10:25:30.395687-0800 webscrape[21420:1832592] Error: Error Domain=NSCocoaErrorDomain Code=256 "The file “george-santayana-quotes” couldn’t be opened." UserInfo={NSURL=https://wisdomquotes.com/george-santayana-quotes}
 2019-12-17 10:25:52.573593-0800 webscrape[21420:1832592] Error: Error Domain=NSCocoaErrorDomain Code=256 "The file “how-to-learn-faster-quotes” couldn’t be opened." UserInfo={NSURL=https://wisdomquotes.com/how-to-learn-faster-quotes}
 2019-12-17 10:25:55.678653-0800 webscrape[21420:1832592] Error: Error Domain=NSCocoaErrorDomain Code=256 "The file “jealousy-and-envy-quotes” couldn’t be opened." UserInfo={NSURL=https://wisdomquotes.com/jealousy-and-envy-quotes}
 2019-12-17 10:26:10.487973-0800 webscrape[21420:1832592] Error: Error Domain=NSCocoaErrorDomain Code=256 "The file “mahatma-gandhi-quotes” couldn’t be opened." UserInfo={NSURL=https://wisdomquotes.com/mahatma-gandhi-quotes}
 2019-12-17 10:26:23.408778-0800 webscrape[21420:1832592] Error: Error Domain=NSCocoaErrorDomain Code=256 "The file “words-of-wisdom-quotes” couldn’t be opened." UserInfo={NSURL=https://wisdomquotes.com/words-of-wisdom-quotes}
 2019-12-17 10:26:51.825329-0800 webscrape[21420:1832592] Error: Error Domain=NSCocoaErrorDomain Code=256 "The file “change-and-growth-quotes” couldn’t be opened."
 
 
 
 */
