//
//  ViewController.swift
//  CollectionViewsPractice
//
//  Created by Hector on 11/28/19.
//  Copyright © 2019 Hector. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let sections = Bundle.main.decode([Section].self, from: "appstore.json")
    
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(sections)
        
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(collectionView)
    }


}













































// MARK: Bundle decode
extension Bundle {
    func decode<T: Decodable>(_ type: T.Type, from file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else { fatalError("Decode failed") }

        guard let data = try? Data(contentsOf: url) else { fatalError("data error") }
        
        let decoder = JSONDecoder()
        
        guard let loaded = try? decoder.decode(T.self, from: data) else { fatalError() }
        
        return loaded
    }
}
