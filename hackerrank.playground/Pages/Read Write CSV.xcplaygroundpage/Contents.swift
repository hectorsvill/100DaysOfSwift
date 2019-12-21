//: [Previous](@previous)

import Foundation


let fm = FileManager()

let dir = fm.urls(for: .desktopDirectory, in: .userDomainMask)

let x = "\(dir.first!.path)/iOS Job Hunt - Sheet1.csv"

let f = FileHandle(forReadingAtPath: x)
let d = try?  Data(contentsOf: URL(fileURLWithPath: x))

//print(String(data: d!, encoding: .utf8)!)

let fstring = String(data: f!.availableData, encoding: .utf8)!.components(separatedBy: .newlines)


print(fstring[0].split(separator: Character(",")))
