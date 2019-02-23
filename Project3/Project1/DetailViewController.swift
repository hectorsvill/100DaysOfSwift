//
//  DetailViewController.swift
//  Project1
//
//  Created by Hector Steven on 2/20/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var ImageView: UIImageView!
    var selectedImage: String? // change navigator name
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "\(selectedImage!)"
        navigationItem.largeTitleDisplayMode = .never
        
        //UIActivityViewController explained – Social media, part 2
        //creating rightbarbutton
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped) )
        
        if let imageToLoad = selectedImage { ImageView.image = UIImage(named: imageToLoad) }
    }
    
    //To hide top view nagitor with a click
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    
    @objc func shareTapped () {
        guard let image = ImageView.image?.jpegData(compressionQuality: 0.8) else {
            print("error: No Image Found")
            return
        }
        
        let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }



}
