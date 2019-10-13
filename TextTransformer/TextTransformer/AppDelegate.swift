//
//  AppDelegate.swift
//  TextTransformer
//
//  Created by Hector on 10/12/19.
//  Copyright © 2019 Hector. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // create the statusbar button
        statusItem.button?.title = "⌬"
        statusItem.button?.target = self
        
        // if statusbar button is selected create view
        statusItem.button?.action = #selector(showSettings)
        
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


    @objc
    func showSettings() {
        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateController(withIdentifier: "ViewController") as? ViewController else {
            fatalError("Unable to find ViewController in storyboard")
        }
        
        let popoverView = NSPopover()
        popoverView.contentViewController = vc
        popoverView.behavior = .transient
        
        guard let button = statusItem.button else {
            fatalError("Couldn't find status item button.")
        }
        
        popoverView.show(relativeTo: button.bounds, of: button, preferredEdge: .maxY)
        
    }
}

