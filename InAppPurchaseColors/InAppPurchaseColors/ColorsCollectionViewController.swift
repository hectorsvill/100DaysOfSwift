//
//  ColorsCollectionViewController.swift
//  InAppPurchaseColors
//
//  Created by s on 3/25/20.
//  Copyright © 2020 s. All rights reserved.
//

import UIKit
import StoreKit

class ColorsCollectionViewController: UIViewController {
    private let productIdentifier = "com.hectorstevenvillasano.InAppPurchaseColors.AllColors"
    var colors: [UIColor] = [#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1), #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1),#colorLiteral(red: 0.1921568662, green: 0.007843137719, blue: 0.09019608051, alpha: 1), #colorLiteral(red: 0.3176470697, green: 0.07450980693, blue: 0.02745098062, alpha: 1), #colorLiteral(red: 0.3098039329, green: 0.2039215714, blue: 0.03921568766, alpha: 1), #colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1), ]
    let lockedColors: [UIColor] = [#colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1), #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1),#colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1), #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1), #colorLiteral(red: 0.5058823824, green: 0.3372549117, blue: 0.06666667014, alpha: 1), #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1), #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1), #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1), #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1), #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1), #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1), #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)]

    var dataSource: UICollectionViewDiffableDataSource<Int, Int>? = nil
    var collectionView: UICollectionView! = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "In-App Purchase Colors"
        SKPaymentQueue.default().add(self)
        view.backgroundColor = .systemBackground
        createCollectionView()
        createDataSource()

        if UserDefaults.standard.bool(forKey: productIdentifier) {
            colors.append(contentsOf: lockedColors)
            reloadData(colors.count)
        }


        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Restore", style: .plain, target: self, action: #selector(restorePurchase))
    }

    func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.2))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }


    private func createCollectionView() {
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: createLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .systemBackground
        collectionView.collectionViewLayout = createLayout()
        collectionView.register(ColorCollectionViewCell.self, forCellWithReuseIdentifier: ColorCollectionViewCell.reuseIdentifier)
        collectionView.delegate = self

        view.addSubview(collectionView)

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
        ])
    }

    private func createDataSource () {
        dataSource = UICollectionViewDiffableDataSource<Int, Int>(collectionView: collectionView) { collectionView, indexPath, i -> UICollectionViewCell? in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ColorCollectionViewCell.reuseIdentifier, for: indexPath) as? ColorCollectionViewCell else { return UICollectionViewCell() }

            if !UserDefaults.standard.bool(forKey: self.productIdentifier) && i == self.colors.count {
                cell.i = i
            }else {
                cell.backgroundColor = self.colors[i]
            }

            cell.layer.cornerRadius = 5
            cell.contentView.layer.cornerRadius = 5

            cell.layer.borderWidth = 0.5

            return cell
        }

        reloadData(colors.count + 1)
    }

    private func reloadData(_ count: Int) {
        var snapShot = NSDiffableDataSourceSnapshot<Int, Int>()
        snapShot.appendSections([0])
        snapShot.appendItems(Array(0..<count),toSection: 0)

        dataSource?.apply(snapShot, animatingDifferences: true)
    }


    @objc func restorePurchase(_ sender: UIBarButtonItem) {
        SKPaymentQueue.default().restoreCompletedTransactions()
    }
}


extension ColorsCollectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if !UserDefaults.standard.bool(forKey: self.productIdentifier) && indexPath.item == colors.count {
            purchaseAllColors()
        }
    }
}

extension ColorsCollectionViewController: SKPaymentTransactionObserver {
    func purchaseAllColors() {
        if SKPaymentQueue.canMakePayments() {
            print("Purchase")

            let payment = SKMutablePayment()
            payment.productIdentifier = productIdentifier
            SKPaymentQueue.default().add(payment)
        } else {
            let ac = UIAlertController(title: "Error", message: "This account can't make payments.", preferredStyle: .actionSheet)
            ac.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(ac, animated: true)
        }
    }

    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        transactions.forEach {
            switch $0.transactionState {
            case .purchasing: break
            case .failed:
                handleError(transaction: $0)
            case .restored:
                haandleRestored(transaction: $0)
            case .purchased:
                handlePurchased(transaction: $0)
            case .deferred:
                print($0.description)
            @unknown default:
                fatalError()
            }
        }

    }


    private func addAllColors() {
        colors.append(contentsOf: lockedColors)
        reloadData(colors.count)
        UserDefaults.standard.set(true, forKey: productIdentifier)
    }

    private func handlePurchased(transaction: SKPaymentTransaction) {
        print("purchase")
        addAllColors()
        SKPaymentQueue.default().finishTransaction(transaction)
    }

    private func haandleRestored(transaction: SKPaymentTransaction) {
        print("restore")
        addAllColors()
        SKPaymentQueue.default().finishTransaction(transaction)
        self.navigationItem.leftBarButtonItem = nil
    }

    private func handleError(transaction: SKPaymentTransaction) {
        if let error = transaction.error {
            let ac = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .actionSheet)
            ac.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(ac, animated: true)
        }

        SKPaymentQueue.default().finishTransaction(transaction)
    }
}

