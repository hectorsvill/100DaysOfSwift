//
//  ViewController.swift
//  TextTransformer
//
//  Created by Hector on 10/12/19.
//  Copyright © 2019 Hector. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSTextFieldDelegate {
    @IBOutlet weak var inputTextField: NSTextField!
    @IBOutlet weak var outputTextField: NSTextField!
    @IBOutlet weak var typeSegegmentedControl: NSSegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func typeChanged(_ sender: Any) {
        switch typeSegegmentedControl.selectedSegment {
        case 0:
            outputTextField.stringValue = rot13(inputTextField.stringValue)
        case 1:
            outputTextField.stringValue = similar(inputTextField.stringValue)
        case 2:
            outputTextField.stringValue = similar(inputTextField.stringValue)
        default:
            outputTextField.stringValue = zalgo(inputTextField.stringValue)
        }
        
        
    }
    
    
    @IBAction func copyButtonPressed(_ sender: Any) {
    }
    
    func rot13(_ input: String) -> String {
        return "Rot12 \(input)"
    }
    
    func similar(_ input: String) -> String {
        return "similar \(input)"
    }
    
    
    func strike(_ input: String) -> String {
        return "strike \(input)"
    }
    
    
    func zalgo(_ input: String) -> String {
        return "salgo \(input)"
    }
}

