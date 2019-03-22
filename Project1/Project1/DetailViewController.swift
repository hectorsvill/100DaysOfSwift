//
//  DetailViewController.swift
//  Project1
//
//  Created by Hector Steven on 2/20/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

	@IBOutlet var ImageCountLabel: UILabel!
	@IBOutlet var ImageView: UIImageView!
	var selectedImage: String? // change navigator name
	var selectedCount: Int?
	
	
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		title = selectedImage!
	
		navigationItem.largeTitleDisplayMode = .never
		
		if let imageToLoad = selectedImage {
			ImageView.image = UIImage(named: imageToLoad)
		}
		
		if let count = selectedCount {
			ImageCountLabel.text = "\(count) Views"
		} else {
			ImageCountLabel.text = ""
		}
		
		
	}
	
	//To hide top view nagitor with a click
	//viewill
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		navigationController?.hidesBarsOnTap = true
	}

	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		navigationController?.hidesBarsOnTap = false
	}



}
