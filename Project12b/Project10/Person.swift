//
//  Person.swift
//  Project10
//
//  Created by Hector Steven on 3/17/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import UIKit

class Person: NSObject {
	var name: String
	var image: String
	
	init(name: String, image: String) {
		self.name = name
		self.image = image
	}
}
