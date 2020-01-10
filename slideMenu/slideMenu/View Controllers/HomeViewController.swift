//
//  HomeViewController.swift
//  slideMenu
//
//  Created by h on 1/9/20.
//  Copyright © 2020 h. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var delegate: HomeControllerViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        configureNavigationBar()
    }
    
    
    func configureNavigationBar() {
        navigationController?.navigationBar.barTintColor = .systemBackground
        navigationController?.navigationBar.barStyle = .black
        
        navigationItem.title = "Side Menue"
        
        let image = UIImage(systemName: "line.horizontal.3")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(handleMenuToggle))
    }
    
    @objc func handleMenuToggle() {
        delegate?.handleMenuToggle()
    }
    
}
