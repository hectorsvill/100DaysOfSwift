//
//  ViewController.swift
//  Project13
//
//  Created by Hector Steven on 3/25/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import UIKit
import CoreImage

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
	
	
	@IBOutlet var intensitySlider: UISlider!
	@IBOutlet var imageView: UIImageView!
	
	var currentImage: UIImage!
	var context: CIContext!
	var currentFilter: CIFilter!
	var imageTitle =  "" {
		didSet {
			title = imageTitle
		}
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		title = "InstaFilter"
		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(importPicture))
		
		context = CIContext()
		currentFilter = CIFilter(name: "CISepiaTone")
		print(intensitySlider.value)
		intensitySlider.value = 0.0
	}

	// import Picture ////////////////////////////////////////////////////////
	
	@objc func importPicture() {
		
		
		
		let picker = UIImagePickerController()
		picker.allowsEditing = true
		picker.delegate = self
		present(picker, animated: true)
	}
	
	func animateImageView() {
//		UIView.animate(withDuration: 1, delay: 0, options: [], animations: {
//
//			self.imageView.alpha = 0.1
//
//		}){ finished in
//			self.imageView.alpha= .identity
//		}
	}
	
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
		guard let image = info[.editedImage] as? UIImage else { return }
		dismiss(animated: true)
		currentImage = image
		
		imageTitle = "image \(Int.random(in: 121...1213))"
		let beginImage = CIImage(image: currentImage)
		currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
		applyProcessing()
		
	}
	
	func applyProcessing() {
		
		let inputKeys = currentFilter.inputKeys //names of all filters
	
		if inputKeys.contains(kCIInputIntensityKey) {
			currentFilter.setValue(intensitySlider.value, forKey: kCIInputIntensityKey)
		}
		
		if inputKeys.contains(kCIInputRadiusKey) {
			currentFilter.setValue(intensitySlider.value * 200, forKey: kCIInputRadiusKey)
		}

		if inputKeys.contains(kCIInputScaleKey) {
			currentFilter.setValue(intensitySlider.value * 10, forKey: kCIInputScaleKey)
		}

		if inputKeys.contains(kCIInputCenterKey) {
			currentFilter.setValue(CIVector(x: currentImage.size.width, y: currentImage.size.height), forKey: kCIInputCenterKey)
		}
		
		guard let outputImage = currentFilter.outputImage else { return }
		
		if let cgimg = context.createCGImage(outputImage, from: currentFilter.outputImage!.extent) {
			let processedImage = UIImage(cgImage: cgimg)
			self.imageView.image = processedImage
		}
	}
	
	@IBAction func changeFilter(_ sender: UIButton) {
		
		imageView.alpha = 0.1
		
		let ac = UIAlertController(title: "Choose filter", message: nil, preferredStyle: .actionSheet)
		ac.addAction(UIAlertAction(title: "CIBumpDistortion", style: .default, handler: setFilter))
		ac.addAction(UIAlertAction(title: "CIGaussianBlur", style: .default, handler: setFilter))
		ac.addAction(UIAlertAction(title: "CIPixellate", style: .default, handler: setFilter))
		ac.addAction(UIAlertAction(title: "CISepiaTone", style: .default, handler: setFilter))
		ac.addAction(UIAlertAction(title: "CITwirlDistortion", style: .default, handler: setFilter))
		ac.addAction(UIAlertAction(title: "CIUnsharpMask", style: .default, handler: setFilter))
		ac.addAction(UIAlertAction(title: "CIVignette", style: .default, handler: setFilter))
		ac.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: resetImageView))
		
		if let popoverController = ac.popoverPresentationController {
			popoverController.sourceView = sender
			popoverController.sourceRect =  sender.bounds
		}

		present(ac, animated: true)
	}
	
	func resetImageView(action: UIAlertAction?) {
		imageView.alpha = 1
		imageView.reloadInputViews()
	}
	
	func setFilter(action: UIAlertAction) {
		resetImageView(action: nil)
		guard currentImage != nil else { return }
		guard let actionTitle = action.title else { return }
	
		currentFilter = CIFilter(name: actionTitle)

		let beginImage = CIImage(image: currentImage)
		currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
		applyProcessing()
	
		//resetImageView()
	}
	
	@IBAction func save(_ sender: Any) {
		guard let image = imageView.image else {
			let ac = UIAlertController(title: "Error", message: "No Image to save!", preferredStyle: .alert)
			ac.addAction(UIAlertAction(title: "ok", style: .cancel))
			present(ac, animated: true)
			return
		}
		UIImageWriteToSavedPhotosAlbum(image, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
	}
	
	@objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
		var title = ""
		var message = ""
		
		if let error = error {
			title = "Save Error"
			message = error.localizedDescription
		} else {
			title = "Saved!"
			message = "Your altered image has been saved to your photos!"
		}

		let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
		ac.addAction(UIAlertAction(title: "Ok", style: .cancel))
		present(ac, animated: true)
	}


	@IBAction func IntensityChanged(_ sender: Any) {
		print(intensitySlider.value)
		applyProcessing()
	}
}

