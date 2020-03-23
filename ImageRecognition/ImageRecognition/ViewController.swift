//
//  ViewController.swift
//  ImageRecognition
//
//  Created by s on 3/23/20.
//  Copyright © 2020 s. All rights reserved.
//

import UIKit
import CoreML
import Vision

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    let imagePicker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Image Classification"
        setupViews()
    }

    private func setupViews() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(cameraTapped))

        imagePicker.delegate = self
        imagePicker.allowsEditing = true
    }

    @objc func cameraTapped() {

        let alertController = UIAlertController(title: "Classify with", message: "", preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
            self.presentImagePicker()
        }))

        alertController.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { _ in
            self.presentImagePicker(with: .photoLibrary)
        }))

        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

        present(alertController, animated: true)

    }

    private func presentImagePicker(with sourceType: UIImagePickerController.SourceType = .camera) {
        self.imagePicker.sourceType = sourceType
        self.present(self.imagePicker, animated: true)
    }

}


extension ViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = image

            guard let ciimage = CIImage(image: image) else { fatalError("error with ciimage") }

            detectImage(ciimage, mlmodel: MobileNetV2().model)
        }

        imagePicker.dismiss(animated: true)
    }

    func detectImage(_ ciimage: CIImage, mlmodel: MLModel) {
        guard let model = try? VNCoreMLModel(for: mlmodel) else { fatalError("error with model") }

        let request = VNCoreMLRequest(model: model) { request, error in
            if let error = error {
                fatalError("request error: \(error)")
            }

            guard let result = request.results as? [VNClassificationObservation] else { fatalError("error with VNClassificationObservation")}

            let first = result.first!
            self.title = first.identifier
        }

        let handler = VNImageRequestHandler(ciImage: ciimage)

        do {
            try handler.perform([request])
        } catch {
            NSLog("\(error)")
        }
    }
}

extension ViewController: UINavigationControllerDelegate {}
