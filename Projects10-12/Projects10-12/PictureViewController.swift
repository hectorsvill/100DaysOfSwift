//
//  PictureViewController.swift
//  Projects10-12
//
//  Created by Hector Steven on 3/23/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import UIKit

class PictureViewController: UIViewController {
	var picture: PicturesCaption?
	var path: String?
	
	@IBOutlet var selectedImageView: UIImageView!
	
	override func viewDidLoad() {
		super.viewDidLoad()

		if let image = path {
			self.selectedImageView?.image = UIImage(contentsOfFile: image)
		}
	}
}
