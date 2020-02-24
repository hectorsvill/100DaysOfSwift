//
//  CarouselViewController.swift
//  InsetItemGrid
//
//  Created by s on 2/23/20.
//  Copyright © 2020 s. All rights reserved.
//

import UIKit

class CarouselViewController: UIViewController {

    enum Section {
        case main
        case main2
        case main3
        case main4
        case main5
        case main6
        case main7
        case main8
    }

    var colors: [UIColor] = [.black, .orange, .systemBlue, .systemPink, .systemPurple, .brown, .systemTeal]
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Int>! = nil


    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Colors"
        createCollectionView()
    }

    private func createCollectionView() {

        collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.backgroundColor = .gray
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")

        collectionView.showsHorizontalScrollIndicator = false
        view.addSubview(collectionView)

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),

//            collectionView.heightAnchor.constraint(equalTo: collectionView.widthAnchor, multiplier: 0.5),

        ])

        dataSource = UICollectionViewDiffableDataSource<Section, Int>(collectionView: collectionView, cellProvider: { collectionView, indexPath, i -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
            cell.backgroundColor = self.colors.randomElement()
            let cornerRadius: CGFloat = 13
            cell.layer.cornerRadius = cornerRadius
            cell.contentView.layer.cornerRadius = cornerRadius

            return cell
        })
//
//        var snapShot = NSDiffableDataSourceSnapshot<Section, Int>()
//
//        snapShot.appendSections([.main])
//        snapShot.appendItems(Array(0..<colors.count), toSection: .main)
//
//        snapShot.appendSections([.main2])
//        snapShot.appendItems(Array(0..<colors.count), toSection: .main2)
//
//        dataSource.apply(snapShot, animatingDifferences: true, completion: nil)

        var snapshot = NSDiffableDataSourceSnapshot<Section, Int>()
        var identifierOffset = 0
        let itemsPerSection = colors.count
        for section in [Section.main, Section.main2, Section.main3, Section.main4, Section.main5, Section.main6, Section.main7] {
            snapshot.appendSections([section])
            let maxIdentifier = identifierOffset + itemsPerSection
            snapshot.appendItems(Array(identifierOffset..<maxIdentifier))
            identifierOffset += itemsPerSection
        }
        dataSource.apply(snapshot, animatingDifferences: false)

    }


    private func createLayout() -> UICollectionViewLayout {
        let square: CGFloat = 0.15
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(square), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(square * 2), heightDimension: .fractionalHeight(square))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        return UICollectionViewCompositionalLayout(section: section)
    }
}

