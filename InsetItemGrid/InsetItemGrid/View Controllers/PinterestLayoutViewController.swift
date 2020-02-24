//
//  PinterestLayoutViewController.swift
//  InsetItemGrid
//
//  Created by s on 2/23/20.
//  Copyright © 2020 s. All rights reserved.
//

import UIKit

class PinterestLayoutViewController: UIView {

    var count: Int? {didSet{ createCollectionView() }}

    enum Section {
        case main
    }

    private var collectionView: UICollectionView! = nil
    var dataSource: UICollectionViewDiffableDataSource<Section, Int>! = nil

    private func createCollectionView() {
        collectionView = UICollectionView(frame: frame, collectionViewLayout: createLayout())
        collectionView.backgroundColor = .systemGray5
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        addSubview(collectionView)

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            collectionView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),
        ])

        dataSource = UICollectionViewDiffableDataSource<Section, Int>(collectionView: collectionView, cellProvider: { collectionView, indexPath, i -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
            cell.backgroundColor = .red
            let cornernRadius: CGFloat = 8
            cell.layer.cornerRadius = cornernRadius
            cell.contentView.layer.cornerRadius = cornernRadius
            return cell
        })

        var snapShot = NSDiffableDataSourceSnapshot<Section, Int>()
        snapShot.appendSections([.main])
        snapShot.appendItems(Array(0...count!))

        dataSource.apply(snapShot, animatingDifferences: true, completion: nil)
    }

    private func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.5))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        let section = NSCollectionLayoutSection(group: group)

        return UICollectionViewCompositionalLayout(section: section)

    }

}
