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
		let f1 = FolderNote()
		f1.folderName = "folder1"
		f1.notes = [Note]()

		f1.notes?.append(Note(noteTitle: "note1", noteString: "note 1 is a note about 1", noteTimeStamp: "1230"))
		f1.notes?.append(Note(noteTitle: "note2", noteString: "note 2 is a note about 2", noteTimeStamp: "1235"))
		f.append(f1)
		
		
		let f2 = FolderNote()
		f2.folderName = "folder2"
		f2.notes = [Note]()
		f2.notes?.append(Note(noteTitle: "note1", noteString: "note 1 is a note about 1", noteTimeStamp: "1230"))
		f2.notes?.append(Note(noteTitle: "note2", noteString: "note 2 is a note about 2", noteTimeStamp: "1235"))
		f.append(f2)
		return f
	}

}
