//
//  Folder.swift
//  hNotes
//
//  Created by Hector Steven on 4/19/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import Foundation

struct Note {
	var noteTitle: String
	var noteTimeStamp: String
	var noteString: String
}

class FolderNote {
	var numberOfNotesInFolder = 0
	var folderName: String? = nil
	var notes: [Note]? = nil
}
