//
//  ViewController.swift
//  Projects10-12
//
//  Created by Hector Steven on 3/23/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
	var pictures = [PicturesCaption]()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		NotificationCenter.default.addObserver(self, selector: #selector(saveAndReload), name: NSNotification.Name(rawValue: "load"), object: nil)
		navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewPicture))
		pictures = getSaveData()
	}
	
	// tableView() ////////////////////////////////////////////////////////////
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return pictures.count
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
		cell.textLabel?.text = "\(pictures[indexPath.row].imageName)"
		return cell
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		if let vc = storyboard?.instantiateViewController(withIdentifier: "Picture") as? PictureViewController  {
			vc.picture = pictures[indexPath.row]
			let path = getDocumentsDirectory().appendingPathComponent(pictures[indexPath.row].image)
			vc.path = path.path
			vc.pictureIndex = indexPath.row
			navigationController?.pushViewController(vc, animated: true)
		}
	}
	
	// @objc func()////////////////////////////////////////////////////////////
	
	@objc func addNewPicture() {
		let picker = UIImagePickerController()
		picker.allowsEditing = true
		picker.delegate = self
		//picker.sourceType = .camera
		present(picker, animated: true)
	}
	
	@objc func saveAndReload(notification: NSNotification) {
		save()
		tableView.reloadData()
	}
	
	// imagePickerController() /////////////////////////////////////////////////
	
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
		guard let image = info[.editedImage] as? UIImage else { return }

		let imageName = UUID().uuidString
		let imagePath = getDocumentsDirectory().appendingPathComponent(imageName)
		
		if let jpegData = image.jpegData(compressionQuality: 0.8) {
			try? jpegData.write(to: imagePath)
		}

		let picture = PicturesCaption(image: imageName, imageName: "image", imageCaption: "")
		
		pictures.append(picture)
		save()
		dismiss(animated: true)
		alertGetImgName(picture)
		
	
		tableView.reloadData()
	}
	
	func getDocumentsDirectory() -> URL {
		let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
		return paths[0]
	}
	
	//func()//////////////////////////////////////////////////////////////////
	
	func save() {
		let jsonEncoder = JSONEncoder()
		print(pictures.count)
		if let saveData = try? jsonEncoder.encode(pictures) {
			let defaults = UserDefaults.standard
			defaults.set(saveData, forKey: "pictures")
		} else {
			sendAlert(title: "Error", message: "Saved data did not load!")
		}
	}
	
	func getSaveData() -> [PicturesCaption] {
		var savedPic = [PicturesCaption]()
		
		let defaults = UserDefaults.standard
		if let savedContent = defaults.object(forKey: "pictures") as? Data {
			let jsondecoder = JSONDecoder()
			do {
				savedPic = try jsondecoder.decode([PicturesCaption].self, from: savedContent)
			} catch {
				print("Error")
			}
		}
		return savedPic
	}
	
	func sendAlert(title: String, message: String?) {
		let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
		ac.addAction(UIAlertAction(title: "OK", style: .cancel))
		present(ac, animated: true)
	}
	
	func alertGetImgName(_ picture: PicturesCaption) {
		let ac = UIAlertController(title: "Set Image Name: ", message: nil, preferredStyle: .alert)
		ac.addTextField()
		ac.addAction(UIAlertAction(title: "Ok", style: .default, handler: {
			[weak self] _ in
			guard let str = ac.textFields?[0].text else { return }
			picture.imageName = str
			self?.tableView.reloadData()
		}))
		present(ac, animated: true)
	}

}

