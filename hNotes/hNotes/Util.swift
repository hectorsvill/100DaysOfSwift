//
//  Util.swift
//  hNotes
//
//  Created by Hector Steven on 4/19/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import Foundation
import UIKit


class Util {
	func getCurrentTime() -> String{
		let date = Date()
		let formater = DateFormatter()
		formater.dateStyle = .none
		formater.timeStyle = .medium
		let timestr = formater.string(from: date)
		
		return timestr
	}
	
	func Tests1() -> [FolderNote]{
		var f = [FolderNote]()
		f.append(FolderNote(folderName: "Folder 1"))
		f.append(FolderNote(folderName: "Folder 2"))
		f.append(FolderNote(folderName: "Folder 3"))
		f.append(FolderNote(folderName: "Folder 4"))
		f.append(FolderNote(folderName: "Folder 5"))
		f.append(FolderNote(folderName: "Folder 6"))
		f.append(FolderNote(folderName: "Folder 7"))
		return f
	}

}
