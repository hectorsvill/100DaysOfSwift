//
//  WhackSlot.swift
//  Project14
//
//  Created by Hector Steven on 3/28/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import Foundation
import SpriteKit


class WhackSlot: SKNode {
	
	func configure(at position: CGPoint) {
		self.position = position
		
		let sprite = SKSpriteNode(imageNamed: "whackHole")
		addChild(sprite)
	}
	
}

