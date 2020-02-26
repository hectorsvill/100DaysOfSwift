//
//  ExpandingTableViewController.swift
//  InsetItemGrid
//
//  Created by s on 2/19/20.
//  Copyright © 2020 s. All rights reserved.
//

import UIKit

class ExpandedItem: Hashable {
    let id: UUID
    let title: String
    var isGroup: Bool
    let items: [ExpandedItem]
    var isExapanded: Bool

    init(id: UUID = UUID(), title: String, isExapanded: Bool,isGroup: Bool,items: [ExpandedItem]) {
        self.id = id
        self.title = title
        self.isExapanded = isExapanded
        self.isGroup = isGroup
        self.items = items
    }

    static func == (lhs: ExpandedItem, rhs: ExpandedItem) -> Bool {
        return lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

class ExpandingTableViewController: UIViewController {

    enum Section {
        case main
    }

    var collectionView: UICollectionView! = nil
    var dataSource: UICollectionViewDiffableDataSource<Section, ExpandedItem>! = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Expanding Views"
        configureCollectionView()
        configureDataSource()


    }

    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, ExpandedItem>(collectionView: collectionView, cellProvider: { collectionView, indexPath, i -> UICollectionViewCell? in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? ItemCollectionViewCell else { fatalError() }
            cell.item = i

            cell.layer.cornerRadius = 7
            return cell
        })

        var snapShot = NSDiffableDataSourceSnapshot<Section, ExpandedItem>()
        snapShot.appendSections([.main])
        snapShot.appendItems([ExpandedItem(title: "m1", isExapanded: false, isGroup: false, items: [])])
//        dataSource.apply(snapShot, animatingDifferences: true)
    }

    private func configureCollectionView() {
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: generateLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemBackground
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.register(ItemCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.delegate = self
        view.addSubview(collectionView)

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            collectionView.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }

    private func generateLayout() -> UICollectionViewLayout {
        let itemHeight = NSCollectionLayoutDimension.absolute(68)

        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: itemHeight)
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: itemHeight)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)

        let layout = UICollectionViewCompositionalLayout(section: section)

        return layout
    }

}


extension ExpandingTableViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? ItemCollectionViewCell else { return }
        cell.expanCell()

        var snapShot = NSDiffableDataSourceSnapshot<Section, ExpandedItem>()
        snapShot.appendSections([.main])
        snapShot.appendItems([ExpandedItem(title: "m1", isExapanded: true, isGroup: false, items: [])])
        dataSource.apply(snapShot, animatingDifferences: true)
    }
}
