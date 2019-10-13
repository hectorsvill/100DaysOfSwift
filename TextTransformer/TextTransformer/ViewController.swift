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
        typeChanged(self)
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
            print("here")
            outputTextField.stringValue = strike(inputTextField.stringValue)
        default:
            outputTextField.stringValue = zalgo(inputTextField.stringValue)
        }
        
        
    }
    
    func controlTextDidChange(_ obj: Notification) {
        typeChanged(self)
    }
    
    @IBAction func copyButtonPressed(_ sender: Any) {
        
        // copy to pasteboard
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString(outputTextField.stringValue, forType: .string)
        
        
    }
    
    func rot13(_ input: String) -> String {
        return "Rot12 \(input)"
    }
    
    func similar(_ input: String) -> String {
        var output = ""
        output = output.replacingOccurrences(of: "a", with: "а")
        output = output.replacingOccurrences(of: "e", with: "е")
        output = output.replacingOccurrences(of: "i", with: "і")
        return output
    }
    
    
    func strike(_ input: String) -> String {
        var output = ""
        
        for letter in input			 {
            output.append(letter)
            output.append("\u{0335}")
        }
        return output
    }
    
    func zalgo(_ input: String) -> String {
        return "salgo \(input)"
    }
}

