//
//  CollectionViewController.swift
//  CollectionViewDemo
//
//  Created by Alex Nagy on 18/01/2020.
//  Copyright © 2020 Alex Nagy. All rights reserved.
//

// https://developer.apple.com/videos/wwdc2019/?q=collection%20view

import UIKit

class CollectionViewController: UIViewController {
    
    // https://jsonplaceholder.typicode.com/
    fileprivate let apiUrl = "https://jsonplaceholder.typicode.com/users"
    
    // TODO: DataSource & DataSourceSnapshot typealias
    
    // MARK: - Properties
    private var collectionView: UICollectionView! = nil
    
    // TODO: dataSource & snapshot
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.title = "Diffable CollectionView"
        
        configureCollectionViewLayout()
        configureCollectionViewDataSource()
        createDummyData()
//        fetchItems()
    }
    
}

// MARK: - Collection View Delegate
extension CollectionViewController: UICollectionViewDelegate  {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // TODO: contact
    }
}

//MARK: - Collection View Setup
extension CollectionViewController {
    
    enum Section {
        case main
    }
    
    private func createLayout() -> UICollectionViewLayout {
        // TODO: Item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
        // TODO: Group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(76))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        // TODO: Section
        let section = NSCollectionLayoutSection(group: group)
        // TODO: Layout
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    private func configureCollectionViewLayout() {
        // TODO: collectionView
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        collectionView.delegate = self
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .systemBackground
        collectionView.register(ContactCell.self, forCellWithReuseIdentifier: ContactCell.reuseIdentifier)
        view.addSubview(collectionView)
    }
    
    private func configureCollectionViewDataSource() {
        // TODO: dataSource
    }
    
    private func createDummyData() {
        var dummyContacts: [Contact] = []
        for i in 0..<10 {
            dummyContacts.append(Contact(id: i, name: "Contact \(i)", username: "", email: "example\(i)@gmail.com", address: Contact.Address(street: "", suite: "", city: "", zipcode: "", geo: Contact.Address.Geo(lat: "", lng: "")), phone: "", website: "", company: Contact.Company(name: "", catchPhrase: "", bs: "")))
        }
        applySnapshot(contacts: dummyContacts)
    }
    
    private func fetchItems() {
        
        guard let url = URL(string: apiUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            if let err = err {
                print(err.localizedDescription)
                return
            }
            
            guard let response = response as? HTTPURLResponse else { return }
            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let fetchedItems = try JSONDecoder().decode([Contact].self, from: data)
                        self.applySnapshot(contacts: fetchedItems)
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            } else {
                print("HTTPURLResponse code: \(response.statusCode)")
            }
        }.resume()
        
    }
    
    private func applySnapshot(contacts: [Contact]) {
        // TODO: snapshot
    }
    
}

