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
	var scoreLabel: SKLabelNode!
	var timerLabel: SKLabelNode!
	var rain: SKEmitterNode!
	var time: Timer!
	var timer_T: Timer!
	
	var score = 0 {
		didSet {
			scoreLabel.text = "Score: \(score)"
		}
	}
	
	var timer = 0 {
		didSet {
			timerLabel.text = "Timer: \(String(timer))"
		}
	}
	
    override func didMove(to view: SKView) {

		rain = SKEmitterNode(fileNamed: "RainParticle")
		rain.position = CGPoint(x: 0, y: 320)
		rain.advanceSimulationTime(5)
		rain.zPosition = -1

		backgroundColor = .black

		scoreLabel = SKLabelNode()
		scoreLabel.position = CGPoint(x: 0 , y: -200)
		scoreLabel.horizontalAlignmentMode = .left
		
		
		timerLabel = SKLabelNode()
		timerLabel.position = CGPoint(x: -100 , y: -200)
		timerLabel.horizontalAlignmentMode = .right
		
		shooter = SKSpriteNode(imageNamed: "cursor")
		shooter.position = CGPoint(x: size.width * 0, y: size.height * 0 )

		
		[rain, shooter, scoreLabel, timerLabel].forEach({
			addChild( $0 )
		})
		
		score = 0
		timer = 59
		
		physicsWorld.gravity = .zero
		physicsWorld.contactDelegate = self
		
		if timer >= 0 {
			time = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(createShips), userInfo: nil, repeats: true)
			timer_T = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timer_set), userInfo: nil, repeats: true)
		}
	}
	

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		
		createSpaveShip(-250, 250)

	}
	
	override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
		guard let touch = touches.first else { return }
		let location = touch.location(in: self)
		
		shooter.position = location
	}
	
	override func update(_ currentTime: TimeInterval) {
		for node in children {
			if node.position.y < -210 {
				node.removeFromParent()
			}
		}
	}
	
}

extension GameScene {
	
	@objc func timer_set() {
		timer -= 1
	}
	
	@objc func createShips() {
		createSpaveShip(-250, -20)
		createSpaveShip(60, 200)
	}
	
	func createSpaveShip(_ rangeX: CGFloat, _ rangeY: CGFloat) {
		
		let sprite = SKSpriteNode(imageNamed: "spaceship")
		sprite.size = CGSize(width: 40, height: 50)
		sprite.zRotation = .pi
		sprite.position = CGPoint(x: CGFloat.random(in: rangeX...rangeY), y: (size.height * 0.15))
		addChild(sprite)
		
		
		sprite.physicsBody = SKPhysicsBody(texture: sprite.texture!, size: sprite.size)
		sprite.physicsBody?.categoryBitMask = 1
		
		let ran1 = CGFloat.random(in: 30...80)
		
		sprite.physicsBody?.velocity = CGVector(dx: CGFloat.random(in: -80...ran1), dy: -400)
	}
}
