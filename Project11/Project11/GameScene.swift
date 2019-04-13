//
//  GameScene.swift
//  Project11
//
//  Created by Hector Steven on 3/18/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate{

	let ballNames = ["ballBlue", "ballCyan", "ballGreen", "ballGrey", "ballPurple", "ballRed", "ballYellow"]
	var ballCount = 0 {
		didSet {
			print(ballCount)
		}
	}
	
	var scoreLabel: SKLabelNode!
	var score = 0 {
		didSet {
			scoreLabel.text = "Score: \(score)"
		}
	}
	
	var editLabel: SKLabelNode!
	var editingMode: Bool = false {
		didSet {
			if editingMode {
				editLabel.text = "Done"
			} else {
				editLabel.text = "Edit"
			}
		}
	}

	override func didMove(to view: SKView) {
		let background = SKSpriteNode(imageNamed: "background")
		background.position = CGPoint(x: 512, y: 384)
		background.blendMode = .replace
		background.zPosition = -1
		addChild(background)

		scoreLabel = SKLabelNode(fontNamed: "Chalkduster")
		scoreLabel.text = "Score: 0"
		scoreLabel.horizontalAlignmentMode = .right
		scoreLabel.position = CGPoint(x: 980, y: 700)
		addChild(scoreLabel)
		
		editLabel = SKLabelNode(fontNamed: "Chalkduster")
		editLabel.text = "Edit"
		editLabel.position = CGPoint(x: 80, y: 700)
		addChild(editLabel)

		physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
		physicsWorld.contactDelegate = self

		makeSlot(at: CGPoint(x: 128, y: 0), isGood: true)
		makeSlot(at: CGPoint(x: 384, y: 0), isGood: false)
		makeSlot(at: CGPoint(x: 640, y: 0), isGood: true)
		makeSlot(at: CGPoint(x: 896, y: 0), isGood: false)
		//makeSlot(at: CGPoint(x: 896, y: 500), isGood: false)

		makebouncer(at: CGPoint(x: 0, y: 0))
		makebouncer(at: CGPoint(x: 256, y: 0))
		makebouncer(at: CGPoint(x: 512, y: 0))
		makebouncer(at: CGPoint(x: 768, y: 0))
		makebouncer(at: CGPoint(x: 1024, y: 0))
		//makebouncer(at: CGPoint(x: 900, y: 350))
		
		
		
		createLine()
	}
	func createLine () {
		let size = CGSize(width: frame.width * 2, height: 5)
		let line = SKSpriteNode(color: .orange, size: size)
		line.position = CGPoint(x: 0, y: 640)
		addChild(line)
	}
	
	
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		
		guard let touch = touches.first else { return }
		let location = touch.location(in: self)
		let objects = nodes(at: location)
		
		if objects.contains(editLabel) {
			editingMode.toggle()	
		} else {
			
			if editingMode && location.y < 640 {
				
				//create a box
				let size = CGSize(width: 100, height: 16)
				
				let box  = SKSpriteNode(color:
					UIColor(red: CGFloat.random(in: 0...1),
					green: CGFloat.random(in: 0...1),
					blue: CGFloat.random(in: 0...1),
					alpha: 1), size: size)
				
				box.zRotation = CGFloat.random(in: 0...3)
				box.position = location
				
				box.physicsBody = SKPhysicsBody(rectangleOf: box.size)
				box.physicsBody?.isDynamic = false
				box.name = "box"
				addChild(box)
				
			} else {
				
				if location.y >= 640 {
					
					
					
					ballCount += 1
					let ball = SKSpriteNode(imageNamed: ballNames.randomElement()!)
					ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.size.width / 2.0)
					ball.physicsBody?.restitution = 0.8
					ball.physicsBody?.contactTestBitMask = ball.physicsBody?.collisionBitMask ?? 0
					ball.position = location
					ball.name = "ball"
					addChild(ball)
				}
//				print(location.y)
			}
		}
	}
	
	func makebouncer(at position: CGPoint) {
		let bouncer = SKSpriteNode(imageNamed: "bouncer")
		bouncer.position = position
		bouncer.physicsBody = SKPhysicsBody(circleOfRadius: bouncer.size.width / 2)
		bouncer.physicsBody?.isDynamic = false
		addChild(bouncer)
	}
	
	func redSquare() {
		let box = SKSpriteNode(color: .red, size: CGSize(width: 64, height: 64))
		box.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 64, height: 64 ))
	}

	func makeSlot(at position: CGPoint, isGood: Bool) {
		var slotBase: SKSpriteNode
		var slotGlow: SKSpriteNode

		if isGood {
			slotBase = SKSpriteNode(imageNamed: "slotBaseGood")
			slotGlow = SKSpriteNode(imageNamed: "slotGlowGood")
			slotBase.name = "good"
		} else {
			slotBase = SKSpriteNode(imageNamed: "slotBaseBad")
			slotGlow = SKSpriteNode(imageNamed: "slotGlowBad")
			slotBase.name = "bad"
		}

		slotBase.position = position
		slotGlow.position = position

		slotBase.physicsBody = SKPhysicsBody(rectangleOf: slotBase.size)
		slotBase.physicsBody?.isDynamic = false
		
		addChild(slotGlow)
		addChild(slotBase)
		
		let spin = SKAction.rotate(byAngle: .pi, duration: 3)
		let spinForever = SKAction.repeatForever(spin)
		slotGlow.run(spinForever)
	}
	
	func collision(between ball: SKNode, object: SKNode) {
		
		if let fireParticles = SKEmitterNode(fileNamed: "FireParticles") {
			fireParticles.position = ball.position
			addChild(fireParticles)
		}
		
		if object.name == "good" {
			destroy(ball: ball)
			score += 1
		} else if object.name == "bad" {
			destroy(ball: ball)
			score -= 1
		} else if object.name == "box" {
			destroy(ball: object)
		}
	}
	
	func destroy(ball: SKNode) {
		ball.removeFromParent()
	}
	
	func didBegin(_ contact: SKPhysicsContact) {
		guard let nodeA = contact.bodyA.node else { return }
		guard let nodeB = contact.bodyB.node else { return }
		
		if nodeA.name == "ball" {
			collision(between: nodeA, object: nodeB)
		} else if nodeB.name == "ball" {
			collision(between: nodeB, object: nodeA)
		}
	}
}
