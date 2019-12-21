//: [Previous](@previous)

import Foundation




//print(String(data: d!, encoding: .utf8)!)



// https://developer.apple.com/documentation/foundation/filehandle












func readCSV(_ csvFile: String) -> [[Any]]{
    // FileHandle - An object-oriented wrapper for a file descriptor.
    let file = FileHandle(forReadingAtPath: csvFile)
    
    guard let data = file?.availableData, let csv_string = String(data: data, encoding: .utf8) else { return [] }
    
    print(csv_string)
    return  []
}





/// main

let fm = FileManager()
let dir = fm.urls(for: .desktopDirectory, in: .userDomainMask)
let fileStr = "\(dir.first!.path)/iOS Job Hunt - Sheet1.csv"

let file = FileHandle(forReadingAtPath: fileStr)

print(file!.availableData)

readCSV(fileStr)



