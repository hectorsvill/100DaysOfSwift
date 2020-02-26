//
//  CircularTransitionViewController.swift
//  InsetItemGrid
//
//  Created by s on 2/25/20.
//  Copyright © 2020 s. All rights reserved.
//

import UIKit

class CircularTransitionViewController: UIViewController {

    @IBOutlet weak var vButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        vButton.layer.cornerRadius = vButton.frame.size.width / 2
    }

}
