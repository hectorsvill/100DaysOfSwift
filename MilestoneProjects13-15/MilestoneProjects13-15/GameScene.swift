//
//  GameScene.swift
//  MilestoneProjects13-15
//
//  Created by Hector Steven on 4/9/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {

	var shooter: SKSpriteNode!
	var rain: SKEmitterNode!
	
    override func didMove(to view: SKView) {

		
		rain = SKEmitterNode(fileNamed: "RainParticle")
		rain.position = CGPoint(x: 0, y: 320)
		rain.advanceSimulationTime(5)
		rain.zPosition = -1
		backgroundColor = .green
		
		shooter = SKSpriteNode(imageNamed: "cursor")
		shooter.position = CGPoint(x: 0, y: 0)
		shooter.physicsBody = SKPhysicsBody(texture: shooter.texture!, size: shooter.size)
		shooter.physicsBody?.contactTestBitMask = 1
		
		
		
		[rain, shooter].forEach({
			addChild( $0 )
		})
		
		physicsWorld.gravity = .zero
		physicsWorld.contactDelegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		let color = [UIColor.red, UIColor.green, UIColor.yellow, UIColor.blue]
		backgroundColor = color.randomElement()!
		
	}
	
	override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
		guard let touch = touches.first else { return }
		let location = touch.location(in: self)
		//let shooterPos = shooter.position
//		print(location, terminator: "\t")
//		print(shooter.position)
		
		shooter.position = location

	
		
	}
	
}
