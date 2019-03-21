//
//  ViewController.swift
//  Project10
//
//  Created by Hector Steven on 3/15/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
	var persons = [Person]()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewPerson))
		
		let defaults = UserDefaults.standard
		
		if let savedPeople = defaults.object(forKey: "persons") as? Data {
			let jsonDecoder = JSONDecoder()
			do {
				persons = try jsonDecoder.decode([Person].self, from: savedPeople)
			} catch {
				print("Failled to load people")
			}
		}
		
	}
	
	//objc() ////////////////////////////////////////////////////////
	
	@objc func addNewPerson() {
		let picker = UIImagePickerController()
		picker.allowsEditing = true
		picker.delegate = self
		present(picker, animated: true)
	}
	
	//collectionView() ////////////////////////////////////////////////////////

	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return persons.count
	}

	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Person", for: indexPath) as? PersonCell else {
			fatalError("unable to dequeue Reusable Cell")
		}

		let person = persons[indexPath.item]

		cell.name.text = person.name

		let path = getDocumentsDirectory().appendingPathComponent(person.image)
		cell.imageView.image = UIImage(contentsOfFile: path.path)

		cell.imageView.layer.borderColor = UIColor(white: 0, alpha: 0.3).cgColor
		cell.imageView.layer.borderWidth = 2
		cell.imageView.layer.cornerRadius = 3
		cell.layer.cornerRadius = 3

		return cell
	}

	override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

		let person = persons[indexPath.item]

		let ac = UIAlertController(title: "Rename Person", message: nil, preferredStyle: .alert)

		ac.addTextField()
		ac.addAction(UIAlertAction(title: "Canel", style: .cancel))
		
		ac.addAction(UIAlertAction(title: "OK", style: .default) {
			[weak self, weak ac] _ in
			
			guard let newName = ac?.textFields?[0].text else { return }
			
			person.name = newName
			self?.save()
			self?.collectionView.reloadData()
		})
		
		ac.addAction(UIAlertAction(title: "Delete Person", style: .default) {
			[weak self] _ in
			self?.persons.remove(at: indexPath.item)
			self?.collectionView.reloadData()
		})
			
		present(ac, animated: true)
	}
	
	//func() //////////////////////////////////////////////////////////////////

	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
		guard let image = info[.editedImage] as? UIImage else { return }

		let imageName = UUID().uuidString
		let imagePath = getDocumentsDirectory().appendingPathComponent(imageName)
		
		if let jpegData = image.jpegData(compressionQuality: 0.8) {
			try? jpegData.write(to: imagePath)
		}

		let person = Person(name: "Uknown", image: imageName)
		persons.append(person)
		save()
		collectionView.reloadData()
		dismiss(animated: true)
	}

	func getDocumentsDirectory() -> URL {
		let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
		return paths[0]
	}
	/*
	
	
		project 12
	
	*/
	func save() {
		let jsonEncoder = JSONEncoder()
		
		if let savedData = try? jsonEncoder.encode(persons) {
			let defaults = UserDefaults.standard
			defaults.set(savedData, forKey: "persons")
		} else {
			print("Failled To Save Data.")
		}
	}
	
	
}

