//
//  TabBarView.swift
//  CustomTabBarTest
//
//  Created by ✨EUGENE✨ on 2021/08/31.
//

import UIKit

class TabBarView: UIView {
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            print("didset")
            collectionView.dataSource = self
            collectionView.delegate = self
            collectionView.register(UINib(nibName: "TabCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TabCollectionViewCell")
        }
    }
    let vm = TabViewModel()
}
extension TabBarView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.vm.numberOfItemsInSection()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TabCollectionViewCell.identifier, for: indexPath) as? TabCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.tabLabel.text = self.vm.tabTypes[indexPath.row]
        return cell
    }
}

extension TabBarView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellHeight = collectionView.frame.height
        let cellWidth = collectionView.frame.width / 6
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
}
