//
//  DetailViewController.swift
//  Project4
//
//  Created by Hector Steven on 2/24/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
	
	
	@IBOutlet var DetailFlagImage: UIImageView!
	var selectedFlag: String?
	
	override func viewDidLoad()
	{
		super.viewDidLoad()
		
		title = selectedFlag!.capitalizingFirstLetter()
		DetailFlagImage.image = UIImage(named: selectedFlag!)
		DetailFlagImage.layer.borderWidth = 1
	
	
	
	}

}
//https://www.hackingwithswift.com/example-code/strings/how-to-capitalize-the-first-letter-of-a-string
extension String
{
	func capitalizingFirstLetter() -> String {
		return prefix(1).capitalized + dropFirst()
	}
	
	mutating func capitalizeFirstLetter() {
		self = self.capitalizingFirstLetter()
	}
}
