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

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sceneView.delegate = self

        createCube()

    }

    private func createCube() {

        let cube = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.01)
        let material = SCNMaterial()
        material.diffuse.contents = UIColor.systemPink

        cube.materials = [material]

        let node = SCNNode()
        node.position = SCNVector3(0, 0, -0.5)
        node.geometry = cube
        sceneView.scene.rootNode.addChildNode(node)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()


        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sceneView.session.pause()
    }
}
