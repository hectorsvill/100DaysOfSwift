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
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        view.addSubview(collectionView)

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            collectionView.heightAnchor.constraint(equalTo: collectionView.widthAnchor, multiplier: 0.5)
        ])

        dataSource = UICollectionViewDiffableDataSource<Section, Int>(collectionView: collectionView, cellProvider: { collectionView, indexPath, i -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
            cell.backgroundColor = self.colors[indexPath.item]
            cell.layer.cornerRadius = 100
            cell.contentView.layer.cornerRadius = 100

            return cell
        })

        var snapShot = NSDiffableDataSourceSnapshot<Section, Int>()

        snapShot.appendSections([.main])
        snapShot.appendItems(Array(0..<colors.count))
        dataSource.apply(snapShot, animatingDifferences: true, completion: nil)

    }
}

extension CarouselViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2, height: collectionView.frame.width/2)
    }
}
