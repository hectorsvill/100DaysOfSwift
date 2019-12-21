//: [Previous](@previous)

import Foundation




//print(String(data: d!, encoding: .utf8)!)



// https://developer.apple.com/documentation/foundation/filehandle

func readCSV(_ csvFile: String) -> [String: [String]]{
    var table_rows = [String: [String]]()
    let file = FileHandle(forReadingAtPath: csvFile)
    
    guard let data = file?.availableData, let csv_string = String(data: data, encoding: .utf8) else { return [:] }
    let csv_lineSplit = csv_string.components(separatedBy: .newlines).filter { !$0.isEmpty }
    
    // column names
    let header = csv_lineSplit[1].split(separator: ",")
    
    for i in 3..<csv_lineSplit.count - 4 {
        let line = csv_lineSplit[i]
        let tables =  line.components(separatedBy: ",") //csv_lineSplit[i].split(separator: ",")
        
        for (i, str) in header.enumerated() {
            table_rows[String(str), default: []].append(tables[i])
        }
    }
    
    return  table_rows
}


func writeCSV(_ dict: [String: [String]], fileName: String) {
    let columnNames = dict.keys
    
}

/// main
let fm = FileManager()

var desktopDirectory: URL {
    return try! fm.url(for: .desktopDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
}

var desktopFiles: [String] {
    return try! fm.contentsOfDirectory(atPath: desktopDirectory.path).sorted()
}

let bardwell_CSV = desktopFiles[4] // "/Users/hector/Desktop/Joshua Bardwell - Banggood Black Friday FPV Deals - Black Friday Coupon.csv"

let file = desktopDirectory.path + "/\(bardwell_CSV)"

///

let csv = readCSV(file)

writeCSV(csv, fileName: "myCSV")






