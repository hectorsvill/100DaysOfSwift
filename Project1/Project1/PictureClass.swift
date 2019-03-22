//
//  PictureClass.swift
//  Project1
//
//  Created by Hector Steven on 3/21/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import Foundation


class Picture: NSObject, Codable {
	var name: String
	var count: Int

	init(name: String, count: Int) {
		self.name = name
		self.count = count
	}
}
