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

	fileprivate let TimerSet = 90
	
	
//	var ships = [SKSpriteNode]()
	var shooter: SKSpriteNode!
	var scoreLabel: SKLabelNode!
	var timerLabel: SKLabelNode!
	var rain: SKEmitterNode!
	var time: Timer!
	var timer_T: Timer!
	
	var score = 0 {
		didSet {
			scoreLabel.text = score < 10 ? "Score: 0\(score)" : "Score: \(score)"
		}
	}
	
	var timer = 0 {
		didSet {
			timerLabel.text = timer < 10 ? "Timer: 0\(String(timer))" : "Timer: \(String(timer))"
		}
	}
	
    override func didMove(to view: SKView) {

		gameSetup()
		
		score = 0
		timer = TimerSet
		
		physicsWorld.gravity = .zero
		physicsWorld.contactDelegate = self
		
		time = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(createShips), userInfo: nil, repeats: true)
		timer_T = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timer_set), userInfo: nil, repeats: true)
	}
	

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
	}
	
	override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
		guard let touch = touches.first else { return }
		let location = touch.location(in: self)
		let slidedNode = nodes(at: location)
		
		shooter.position = location
		
		for node in slidedNode {
			if node.name == "ship" {
				destroy(node)
			}
		}
	}
	
	
	func destroy (_ n: SKNode) {
		
		guard let explode = SKEmitterNode(fileNamed: "explosion") else { return }
		
		explode.position = n.position
		addChild(explode)
		
		
		n.removeFromParent()
		
		
		
		score += 1
		print("Found Ship")
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

	func gameSetup () {
		
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
		shooter.name = "shot"
		shooter.position = CGPoint(x: size.width * 0, y: size.height * 0 )
		
		
		[rain, shooter, scoreLabel, timerLabel].forEach({
			addChild( $0 )
		})
	}
	
	
	func createSpaceShip(_ rangeX: CGFloat, _ rangeY: CGFloat) {
		
		if !timercheck(timer) { return }
		
		let sprite = SKSpriteNode(imageNamed: "spaceship")
		sprite.name = "ship"
		
		sprite.size = CGSize(width: 40, height: 50)
		sprite.zRotation = .pi
		sprite.position = CGPoint(x: CGFloat.random(in: rangeX...rangeY), y: (size.height * 0.15))
		addChild(sprite)
//		ships.append(sprite)
//		print(sprite.name)
		
		sprite.physicsBody = SKPhysicsBody(texture: sprite.texture!, size: sprite.size)
		sprite.physicsBody?.categoryBitMask = 1
		
		let ran1 = CGFloat.random(in: 30...80)
		
		sprite.physicsBody?.velocity = CGVector(dx: CGFloat.random(in: -80...ran1), dy: -400)
	}
	
}



extension GameScene {
	
	@objc func timer_set() {
		if !timercheck(timer) { return }
		
		timer -= 1
	}
	
	@objc func createShips() {
		createSpaceShip(-250, -20)
		createSpaceShip(60, 200)
	}
	
	func timercheck(_ time: Int) -> Bool {
		if time <= 0 {
			return false
		}
		return true
	}
}
