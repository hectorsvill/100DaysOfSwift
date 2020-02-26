//
//  TransitionToViewController.swift
//  InsetItemGrid
//
//  Created by s on 2/25/20.
//  Copyright © 2020 s. All rights reserved.
//

import UIKit

class TransitionToViewController: UIViewController {

    @IBOutlet weak var hButton: UIButton!



    override func viewDidLoad() {
        super.viewDidLoad()

        hButton.layer.cornerRadius = hButton.frame.size.width / 2 

    }

    @IBAction func hButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}
