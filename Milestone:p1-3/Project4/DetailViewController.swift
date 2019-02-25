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
		
		title = selectedFlag!.uppercased()
		DetailFlagImage.image = UIImage(named: selectedFlag!)
		DetailFlagImage.layer.borderWidth = 1
		DetailFlagImage.layer.borderColor = UIColor.lightGray.cgColor
	
		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(ShareFlag))
	
	}
	
	
	@objc func ShareFlag ()
	{
		guard let image = DetailFlagImage.image?.jpegData(compressionQuality: 0.8) else{
			print("none")
			return
		}
		
		let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
		vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
		present(vc,animated: true)
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
