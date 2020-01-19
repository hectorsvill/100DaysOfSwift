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
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .systemGray
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(MenuTableViewCell.self, forCellReuseIdentifier: "MenuCell")
        tableView.separatorStyle = .none
        tableView.rowHeight = 80
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
}

extension MenuViewController:  UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuTableViewCell
        
        
        
        return cell
    }
}
