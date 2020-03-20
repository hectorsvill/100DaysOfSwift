//
//  ViewController.swift
//  ArDicee
//
//  Created by s on 3/19/20.
//  Copyright © 2020 s. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    var diceArray = [SCNNode]()

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "AR Dicee"

//        sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]

        sceneView.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal

        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sceneView.session.pause()
    }

    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        if anchor is ARPlaneAnchor {
            let planeAnchor = anchor as! ARPlaneAnchor
            let plane = SCNPlane(width: CGFloat(planeAnchor.extent.x), height: CGFloat(planeAnchor.extent.z))
            let planeNode = SCNNode()

            planeNode.position = SCNVector3(planeAnchor.center.x, 0, planeAnchor.center.z)
            planeNode.transform = SCNMatrix4MakeRotation(-Float.pi/2, 1, 0, 0)

            let gridMaterial = SCNMaterial()
            gridMaterial.diffuse.contents = UIImage(named: "grid")
            plane.materials = [gridMaterial]
            planeNode.geometry = plane
            node.addChildNode(planeNode)
        } else {
            return
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let touchLocation = touch.location(in: sceneView)
            let results = sceneView.hitTest(touchLocation, types: .existingPlaneUsingExtent)

            if let hitResult = results.first {
                let x = hitResult.worldTransform.columns.3.x
                let y = hitResult.worldTransform.columns.3.y
                let z = hitResult.worldTransform.columns.3.z
                createDicee(x: x, y: y, z: z)
            }
        }
    }

    @IBAction func exit(_ sender: Any) {
        if !diceArray.isEmpty {
            diceArray.forEach {
                $0.removeFromParentNode()
            }
        }
    }

    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        rollAll()
    }

    @IBAction func rollButtonPressed(_ sender: Any) {
        rollAll()
    }

}

extension ViewController {
    func rollAll() {
        if !diceArray.isEmpty {
            for dice in diceArray {
                roll(dice: dice)
            }
        }
    }

    func roll(dice: SCNNode) {
        let randomX = Float.random(in: 1...4) * (Float.pi/2)
        let randomY = Float.random(in: 1...4) * (Float.pi/2)
        dice.runAction(
            SCNAction.rotateBy(x: CGFloat(randomX * 5), y: 0, z: CGFloat(randomY * 5), duration: 0.3)
        )
    }


    private func createDicee(x: Float, y: Float, z: Float) {
           let diceScene = SCNScene(named: "art.scnassets/diceCollada.scn")!
           if let diceNode = diceScene.rootNode.childNode(withName: "Dice", recursively: true) {
                diceNode.position = SCNVector3(x, y + diceNode.boundingSphere.radius, z)
                sceneView.scene.rootNode.addChildNode(diceNode)
                sceneView.autoenablesDefaultLighting = true
                diceArray.append(diceNode)
                roll(dice: diceNode)
           }
       }

       private func sphere() {
           let cube = SCNSphere(radius: 0.2)
           let material = SCNMaterial()
           material.diffuse.contents = UIImage(named: "2k_ceres_fictional")
           cube.materials = [material]

           let node = SCNNode()
           node.position = SCNVector3(0, 0, -0.5)
           node.geometry = cube
           sceneView.scene.rootNode.addChildNode(node)
           sceneView.autoenablesDefaultLighting = true
       }

       private func createCube() {
           let cube = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.01)
           let material = SCNMaterial()
           material.diffuse.contents = UIImage(named: "2k_stars_milky_way.jpg")

           cube.materials = [material]

           let node = SCNNode()
           node.position = SCNVector3(0, 0, -0.5)
           node.geometry = cube
           sceneView.scene.rootNode.addChildNode(node)
           sceneView.autoenablesDefaultLighting = true

       }

}
