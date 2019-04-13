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

	var enemyships = SpaceShip()
	
	var shooter: SKSpriteNode!
	var scoreLabel: SKLabelNode!
	var timerLabel: SKLabelNode!
	var rain: SKEmitterNode!
	var pauseLabel: SKLabelNode!
	
	var shipsDestroyed: SKLabelNode!
	var shipsNotDestroyed: SKLabelNode!
	var totalships: SKLabelNode!
	
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
	
	@objc func appMovedToBackground() {
		print("App moved to background!")
		if timer == 0 {
			isPaused.toggle()
		}
	}
	@objc func appMovedToForground() {
		print("App moved to forground!")
		if timer == 0 {
			isPaused.toggle()
		}
	}

    override func didMove(to view: SKView) {
		
		NotificationCenter.default.addObserver(self, selector: #selector(appMovedToBackground), name: UIApplication.willResignActiveNotification, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(appMovedToForground), name: UIApplication.willEnterForegroundNotification, object: nil)
		
		gameSetup()
		
		score = 0
		timer = 5
		
		physicsWorld.gravity = .zero
		physicsWorld.contactDelegate = self
		
		time = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(createShips), userInfo: nil, repeats: true)
		timer_T = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timer_set), userInfo: nil, repeats: true)
	}

	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		guard let touch = touches.first else { return }
		let location = touch.location(in: self)
		
		shooter.position = location
		
		let touched = nodes(at: location)
		for node in touched {
			if node.name == "pause" {
				isPaused.toggle()
			}
		}
	}
	
	override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
		guard let touch = touches.first else { return }
		let location = touch.location(in: self)

		shooter.position = location
		
		if isPaused { return }
		
		let movingTouch = nodes(at: location)
		for node in movingTouch {
			if node.name == "ship" { destroy(node) }
		}
	}

	override func update(_ currentTime: TimeInterval) {
		for node in children {
			if node.position.y < -210 {
				enemyships.numberOfShipsNotDestroyed += 1
				node.removeFromParent()
			}
		}
	}
}

extension GameScene {
	
	func gameSetup() {
		backgroundColor = .black
		
		rain = SKEmitterNode(fileNamed: "RainParticle")
		rain.position = CGPoint(x: 0, y: 320)
		rain.advanceSimulationTime(5)
		rain.zPosition = -1

		timerLabel = SKLabelNode()
		timerLabel.position = CGPoint(x: -100 , y: -200)
		timerLabel.horizontalAlignmentMode = .right
		
		scoreLabel = SKLabelNode()
		scoreLabel.position = CGPoint(x: 0 , y: -200)
		scoreLabel.horizontalAlignmentMode = .left

		pauseLabel = SKLabelNode()
		pauseLabel.position = CGPoint(x: 250 , y: -200)
		pauseLabel.horizontalAlignmentMode = .right
		pauseLabel.name = "pause"
		pauseLabel.text = "Pause"
		
		createEndGameLabels()
		
		shooter = SKSpriteNode(imageNamed: "cursor")
		shooter.name = "shot"
		
		shooter.position = CGPoint(x: size.width * 0, y: size.height * 0 )

		[rain, shooter, scoreLabel, timerLabel, pauseLabel].forEach({
			addChild( $0 )
		})
	}
	
	func createEndGameLabels() {
		shipsDestroyed = SKLabelNode()
		
		shipsDestroyed.horizontalAlignmentMode = .center
		shipsDestroyed.position = CGPoint(x: 0, y: 100)
		shipsDestroyed.isHidden.toggle()
		
		shipsNotDestroyed = SKLabelNode()
		shipsNotDestroyed.horizontalAlignmentMode = .center
		shipsNotDestroyed.position = CGPoint(x: 0, y: 0)
		shipsNotDestroyed.isHidden.toggle()
		
		totalships = SKLabelNode()
		totalships.horizontalAlignmentMode = .center
		totalships.position = CGPoint(x: 0, y: -100)
		totalships.isHidden.toggle()
		
		[shipsDestroyed, shipsNotDestroyed, totalships].forEach({
			addChild( $0 )
		})
	}
	
	
	func createSpaceShip(_ rangeX: CGFloat, _ rangeY: CGFloat) {
		enemyships.totalships += 1
		let sprite = SKSpriteNode(imageNamed: "spaceship")
		sprite.name = "ship"
		
		sprite.size = CGSize(width: 40, height: 40)
		sprite.zRotation = .pi
		sprite.position = CGPoint(x: CGFloat.random(in: rangeX...rangeY), y: (size.height * 0.15))
		addChild(sprite)
		
		sprite.physicsBody = SKPhysicsBody(texture: sprite.texture!, size: sprite.size)
		sprite.physicsBody?.categoryBitMask = 1
		
		let ran1 = CGFloat.random(in: 30...80)
		sprite.physicsBody?.velocity = CGVector(dx: CGFloat.random(in: -80...ran1), dy: -400)
	}
	
}

extension GameScene {

	@objc func timer_set() {
		if isPaused { return }
		if !timercheck(timer) && children.isEmpty { return }
		if timer >= 1 {
			timer -= 1
		}
	}
	
	@objc func createShips() {
		if isPaused  || timer <= 0 { return }
		if let ran = [1,2,3,5,1,2,3,5].randomElement() {
			switch ran {
			case 1:
				createSpaceShip(-250, -150)
			case 2:
				createSpaceShip(-99, -30)
			case 3:
				createSpaceShip(60, 200)
			default:
				createSpaceShip(-350, -190)
				createSpaceShip(190, 250)
			}
		} else {
			print("Error: createships()")
		}
	}
	
	func timercheck(_ time: Int) -> Bool {
		if time <= 0 {
			gameEnded()
			return false
		}
		return true
	}
	
	func destroy (_ n: SKNode) {
		guard let explode = SKEmitterNode(fileNamed: "explosion") else { return }
		explode.position = n.position
		addChild(explode)
		n.removeFromParent()
		score += 1
	}
	
	func gameEnded() {
//		print("game Ended")
		
		timerLabel.isHidden.toggle()
		scoreLabel.isHidden.toggle()
		pauseLabel.isHidden.toggle()
		
		shipsDestroyed.isHidden.toggle()
		shipsDestroyed.text = "Ships Destroyed: \(score) \n"
		shipsNotDestroyed.isHidden.toggle()
		shipsNotDestroyed.text = "Ships Not Destroyed: \(enemyships.numberOfShipsNotDestroyed)"
		totalships.isHidden.toggle()
		totalships.text = "Total Ships: \(enemyships.totalships)"
		
		isPaused = true
	}
	
	
}
