//
//  ViewController.swift
//  Project13
//
//  Created by Hector Steven on 3/25/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
	
	
	@IBOutlet var intensitySlider: UISlider!
	@IBOutlet var imageView: UIView!
	var currentImage: UIImage!

	override func viewDidLoad() {
		super.viewDidLoad()
		title = "InstaFiter"
		
		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(importPicture))
	}

	// import Picture ////////////////////////////////////////////////////////
	
	@objc func importPicture() {
		let picker = UIImagePickerController()
		picker.allowsEditing = true
		picker.delegate = self
		present(picker, animated: true)
	}
	
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
		guard let image = info[.editedImage] as? UIImage else { return }
		dismiss(animated: true)
		currentImage = image
	}
	
	@IBAction func changeFilter(_ sender: Any) {
	}

	@IBAction func save(_ sender: Any) {
	}

	@IBAction func IntensityChanged(_ sender: Any) {
	}
}

