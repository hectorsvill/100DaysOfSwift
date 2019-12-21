//: [Previous](@previous)

import Foundation


let fm = FileManager()

let dir = try! fm.urls(for: .desktopDirectory, in: .userDomainMask)

let x = "\(dir.first!.path)/iOS Job Hunt - Sheet1.csv"

//let d = Data(contentsOf: <#T##URL#>)
let f = FileHandle(forReadingAtPath: x)
print()
print(String(data: f!.availableData, encoding: .utf8)!)


