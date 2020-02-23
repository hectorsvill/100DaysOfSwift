//
//  ViewController.swift
//  InsetItemGrid
//
//  Created by s on 2/18/20.
//  Copyright © 2020 s. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    enum Section {
        case main
    }

    var dataSource: UICollectionViewDiffableDataSource<Section, Int>! = nil
    var collectionView: UICollectionView! = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        title = " Inset Item Grid"
        createCollectionView()
        configureDataSource()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(goToDropDownMenuView))
    }

    @objc func goToDropDownMenuView() {
        let vc = DropDownMenuViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

}
extension ViewController {
    private func createLayout () -> UICollectionViewLayout{
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.333), heightDimension: .fractionalHeight(1.0))

        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.3))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)

        return layout
    }

    private func createCollectionView() {
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: createLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.backgroundColor = .systemBackground
        collectionView.delegate = self
        view.addSubview(collectionView)
    }

    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Int>(collectionView: collectionView, cellProvider: { collectionView, indexPath, Int -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
            cell.contentView.backgroundColor = .systemGray4
            cell.layer.borderColor = UIColor.black.cgColor
            cell.layer.borderWidth = 1
            let cornerRadius: CGFloat = 5
            cell.layer.cornerRadius = cornerRadius
            cell.contentView.layer.cornerRadius = cornerRadius
            return cell
        })

        var snapShot = NSDiffableDataSourceSnapshot<Section, Int>()
        snapShot.appendSections([.main])
        snapShot.appendItems(Array(0..<20))
        dataSource.apply(snapShot, animatingDifferences: true)
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let alertController = UIAlertController(title: "\(indexPath.item)", message: "", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        present(alertController, animated: true)
    }
}

