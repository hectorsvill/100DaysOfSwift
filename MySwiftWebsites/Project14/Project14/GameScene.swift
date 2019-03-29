//
//  GameScene.swift
//  Project14
//
//  Created by Hector Steven on 3/28/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
	var slots = [WhackSlot]()
	var gameScoreLabel: SKLabelNode!
	
	var score = 0
	
	override func didMove(to view: SKView) {
		
		let background = SKSpriteNode(imageNamed: "whackBackground")
		background.position = CGPoint(x: 512, y: 384)
		background.blendMode = .replace
		background.zPosition = -1
		addChild(background)
		
		gameScoreLabel = SKLabelNode(fontNamed: "chalkduster")
		gameScoreLabel.text = "Score: 0"
		gameScoreLabel.position = CGPoint(x: 8, y: 8)
		gameScoreLabel.horizontalAlignmentMode = .left
		gameScoreLabel.fontSize = 48
		
		addChild(gameScoreLabel)
		
		
	}

	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		
	}
	
	func createSlot(at position: CGPoint) {
		let slot = WhackSlot()
		slot.configure(at: position)
		addChild(slot)
		slots.append(slot)
	}

}
