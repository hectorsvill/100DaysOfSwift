//
//  ViewController.swift
//  Project12
//
//  Created by Hector Steven on 3/21/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		
		let defaults = UserDefaults.standard
		defaults.set("hector v", forKey: "name")
		defaults.set(29, forKey: "age")
		
		defaults.set(true, forKey: "UseTouchID")
		defaults.set(CGFloat.pi, forKey: "Pi")
		
		defaults.set("Paul Hudson", forKey: "Name")
		defaults.set(Date(), forKey: "LastRun")
		
		let array = ["Hello", "World"]
		defaults.set(array, forKey: "SavedArray")
		
		let dict = ["Name": "Paul", "Country": "UK"]
		defaults.set(dict, forKey: "SavedDict")
		
		let arr = defaults.object(forKey:"SavedArray") as? [String] ?? [String]()
		let di = defaults.object(forKey: "SavedDict") as? [String: String] ?? [String: String]()
		
		print(arr)
		print(di)
		
	}


}

