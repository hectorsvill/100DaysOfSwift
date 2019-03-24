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
		navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewPicture))
		pictures = getSaveData()
	}
	
	//tableView()/////////////////////////////////////////////////////////////
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
			
			navigationController?.pushViewController(vc, animated: true)
		}
	
	}
	
	//@objc func()//////////////////////////////////////////////////////////
	
	@objc func addNewPicture() {
		let picker = UIImagePickerController()
		picker.allowsEditing = true
		picker.delegate = self
		//picker.sourceType = .camera
		present(picker, animated: true)
	}
	
	//imagePickerController()///////////////////////////////////////////////////
	
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
		tableView.reloadData()
		dismiss(animated: true)
	}
	
	func getDocumentsDirectory() -> URL {
		let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
		return paths[0]
	}
	
	//func()///////////////////////////////////////////////////
	
	func save() {
		let jsonEncoder = JSONEncoder()
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
	
}
