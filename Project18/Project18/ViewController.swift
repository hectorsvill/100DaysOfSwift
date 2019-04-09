//
//  ViewController.swift
//  Project18
//
//  Created by Hector Steven on 4/8/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		
		//asert_test()
		DebuggingWithBreakpoints()
	
	}
	
	func DebuggingWithBreakpoints() {
		for i in 1...100 {
			print("got number \(i)")
		}
	}
	
	func asert_test() {
		assert(1 == 1, "math is incorrect!")
		assert( 1 + 1 == 1, "math is incorrect!")
	}
	
	func print_test() {
		print(1, 2, 3, 4, "print is variadic")
		print("termintor : ", terminator: "\n\n")
		print(1, 2, 3, 4 , separator: " separator ")
	}

}

