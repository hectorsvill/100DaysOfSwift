//
//  QuoteCollectionViewController.swift
//  Quote-moc1
//
//  Created by Hector on 12/11/19.
//  Copyright © 2019 Hector. All rights reserved.
//

import UIKit


typealias QuoteDataSource = UICollectionViewDiffableDataSource<QuoteCollectionViewController.Section, Quote>

class QuoteCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    enum Section {
        case main
    }
    
    var quotes: [Quote] = []
    
    private var dataSource: QuoteDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .systemBackground
        collectionView.isPagingEnabled = true
        collectionView.register(QuoteCollectionViewCell.self, forCellWithReuseIdentifier: QuoteCollectionViewCell.reuseIdentifier)
        
        configureDataSource()
        createQuoteData()
        createSnapShot()
        
    }
    
    
    
    private func configureDataSource() {
        
        dataSource = QuoteDataSource(collectionView: collectionView) {
            (collectionView, indexPath, quote) -> UICollectionViewCell? in
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: QuoteCollectionViewCell.reuseIdentifier, for: indexPath) as! QuoteCollectionViewCell
            cell.quote = quote
            return cell
        }
        
        
    }
    
    
    func createSnapShot() {
        var snapShot = NSDiffableDataSourceSnapshot<Section, Quote>()
        snapShot.appendSections([.main])
        
        snapShot.appendItems(quotes)
        dataSource.apply(snapShot, animatingDifferences: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    
}
