//
//  MenuViewController.swift
//  slideMenu
//
//  Created by h on 1/9/20.
//  Copyright © 2020 h. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableview()
    }
    
    func configureTableview() {
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

extension MenuViewController:  UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "", for: indexPath)
        
        
        return cell
    }
    
    
    
    
    
}
