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

		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editTitleOrLable))
		if let image = path {
			self.selectedImageView?.image = UIImage(contentsOfFile: image)
		}
		if let imageName = picture?.imageName {
			pictureTitleLabel.text = imageName
			
		}
		if let imageCaption = picture?.imageCaption {
			pictureCaptionLabel.text = imageCaption
		}
	}
	
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
		
		if label == "Title" {
			pictureTitleLabel.text = str
			picture?.imageName = str
		} else if label == "Caption" {
			pictureCaptionLabel.text = str
			picture?.imageCaption = str
		}
		sendDataToVC()
	}
	
	func sendDataToVC() {
		NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
	}
	
}
