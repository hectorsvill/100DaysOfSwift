//
//  ViewController.swift
//  Project1
//
//  Created by Hector Steven on 2/19/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var pictueres = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        let fm = FileManager.default //data type that lets us work with the filesystem
        let path = Bundle.main.resourcePath! //directory path to pictures
        let items = try! fm.contentsOfDirectory(atPath: path)   //The items constant will be an array of strings containing filenames.
        
        for item in items {
            //set pictures
            if item.hasPrefix("nssl") {
                
                pictueres.append(item)
            }
        }
        for p in pictueres { print(p) }
        
    }
    

}

