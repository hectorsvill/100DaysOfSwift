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
		
		title = selectedFlag!
		DetailFlagImage.image = UIImage(named: selectedFlag!)
		
	}

	
	
}
