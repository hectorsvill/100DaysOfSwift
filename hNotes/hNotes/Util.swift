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
}
