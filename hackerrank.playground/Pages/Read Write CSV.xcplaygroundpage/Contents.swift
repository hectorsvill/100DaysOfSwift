//: [Previous](@previous)

import Foundation




//print(String(data: d!, encoding: .utf8)!)



// https://developer.apple.com/documentation/foundation/filehandle












func readCSV(_ csvFile: String) -> [[String]]{
    // FileHandle - An object-oriented wrapper for a file descriptor.
    let file = FileHandle(forReadingAtPath: csvFile)
    
    guard let data = file?.availableData,
        let csv_string = String(data: data, encoding: .utf8) else { return [] }
    
    let csv_lineSplit = csv_string.components(separatedBy: .newlines)
    
//    print(csv_lineSplit[0])
    
    for i in 1..<csv_lineSplit.count {
        let line = csv_lineSplit[0]
        if !line.isEmpty {
            let tables =  csv_lineSplit[i] //csv_lineSplit[i].split(separator: ",")
            
            print(tables)
        }
        
    }
    
    return  []
}

/// main
let fm = FileManager()

var desktopDirectory: URL {
    return try! fm.url(for: .desktopDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
}

var desktopFiles: [String] {
    return try! fm.contentsOfDirectory(atPath: desktopDirectory.path).sorted()
}

let bardwell_CSV = desktopFiles[4]

let file = desktopDirectory.path + "/\(bardwell_CSV)"

print(file)
readCSV(file)



