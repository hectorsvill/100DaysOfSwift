//
//  ViewController.swift
//  AR Ruller
//
//  Created by s on 3/21/20.
//  Copyright © 2020 s. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {
    var dotNodes = [SCNNode]()
    var textNode: SCNNode? = nil

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]
        sceneView.delegate = self
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(erase))

    }

    @objc func erase() {
        dotNodes.forEach{ $0.removeFromParentNode() }
        textNode?.removeFromParentNode()
        dotNodes.removeAll()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        configuration.planeDetection = .vertical
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sceneView.session.pause()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touchLocation = touches.first?.location(in: sceneView),
            let hitRusult = sceneView.hitTest(touchLocation, types: .featurePoint).first {
            if dotNodes.count <= 1 {
                addDot(at: hitRusult)
            }
        }
    }

    func addDot(at hitResult: ARHitTestResult) {
        let dotGeometry = SCNSphere(radius: 0.005)
        let material = SCNMaterial()
        material.diffuse.contents = UIColor.purple
        dotGeometry.materials = [material]

        let dotNode = SCNNode(geometry: dotGeometry)
        dotNode.position = SCNVector3(hitResult.worldTransform.columns.3.x, hitResult.worldTransform.columns.3.y, hitResult.worldTransform.columns.3.z)
        sceneView.scene.rootNode.addChildNode(dotNode)
        dotNodes.append(dotNode)

        if dotNodes.count >= 2 {
            calculate()
        }
    }


    func calculate() {
        let startNode = dotNodes[0]
        let endNode = dotNodes[1]

        let xValue = endNode.position.x - startNode.position.x
        let yValue = endNode.position.y - startNode.position.y
        let zValue = endNode.position.z - startNode.position.z

        let distance = sqrt(xValue + yValue + zValue)
        let str = String(format: "%0.3f", distance)
        updateText(text: "\(str)", atPosition: endNode.position)
    }

    func updateText(text: String, atPosition position: SCNVector3) {
        let textGeometry = SCNText(string: text, extrusionDepth: 1.0)
        textGeometry.firstMaterial?.diffuse.contents = UIColor.systemPurple

        textNode = SCNNode(geometry: textGeometry)
        textNode?.position = SCNVector3(position.x, position.y, position.z)
        textNode?.scale = SCNVector3(0.01, 0.01, 0.01)

        sceneView.scene.rootNode.addChildNode(textNode!)
    }
}

