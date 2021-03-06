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
	var pictureIndex: Int?
	var path: String?
	
	@IBOutlet var pictureCaptionLabel: UILabel!
	@IBOutlet var pictureTitleLabel: UILabel!
	@IBOutlet var selectedImageView: UIImageView!
	
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setLabel()
		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editTitleOrLable))
	}
	
	// @objc func() //////////////////////////////////////////////////////////
	
	@objc func editTitleOrLable() {
		let ac = UIAlertController(title: "Edit Picture Information", message: nil, preferredStyle: .actionSheet)
		ac.addAction(UIAlertAction(title: "Edit Title", style: .default) {
			[weak self] _ in
			self?.editTitle()
		})
		ac.addAction(UIAlertAction(title: "Edit Caption", style: .default) {
			[weak self] _ in
			self?.editCaption()
		})
		ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
		present(ac, animated: true)
	}
	
	// func() /////////////////////////////////////////////////////////////////
	
	fileprivate func setLabel() {
		if let image = path {
			self.selectedImageView?.image = UIImage(contentsOfFile: image)
		}
		if let imageName = picture?.imageName {
			pictureTitleLabel.text = imageName
			
		}
		if let imageCaption = picture?.imageCaption {
			pictureCaptionLabel.text = imageCaption
		}

		let color = getNewColor().cgColor
		pictureTitleLabel.layer.borderColor = color
		pictureCaptionLabel.layer.borderWidth = 1
		pictureCaptionLabel.layer.cornerRadius = 5
		
		pictureCaptionLabel.layer.borderColor = color
		pictureTitleLabel.layer.borderWidth = 1
		pictureTitleLabel.layer.cornerRadius = 10
		selectedImageView.layer.borderWidth = 1
	}
	
	func editTitle () {
		alertTextField(tc: "Title")
	}
	
	func editCaption() {
		alertTextField(tc: "Caption")
	}
	
	func alertTextField(tc: String) {
		let ac = UIAlertController(title: "Edit \(tc)", message: nil, preferredStyle: .alert)
		ac.addTextField()
		ac.addAction(UIAlertAction(title: "Ok", style: .default, handler: {
			[weak self] _ in
			guard let str = ac.textFields?[0].text else { return }
			self?.editPictureClass(to: str, label: tc)
		}))
		present(ac, animated: true)
	}
	
	func editPictureClass (to str: String, label: String) {
		var strcpy = ""
		if str.isEmpty {
			strcpy = "image"
		} else {
			strcpy = str
		}
		if label == "Title" {
			pictureTitleLabel.text = strcpy
			picture?.imageName = strcpy
		} else if label == "Caption" {
			pictureCaptionLabel.text = strcpy
			picture?.imageCaption = strcpy
		}
		sendDataToVC()
	}
	
	func sendDataToVC() {
		NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
	}
	
	
	func getRandCGFloat(x: Float, y: Float) -> CGFloat {
		return CGFloat(Float.random(in: x...y) / 250.0)
	}
	
	func getNewColor() -> UIColor {
		let newColor = UIColor(red: getRandCGFloat(x: 22.0, y: 159.0), green: getRandCGFloat(x: 10.0, y: 89.0), blue: getRandCGFloat(x: 170.0, y: 210.0), alpha: 1.0)
		return newColor
	}
	
}
