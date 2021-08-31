//
//  ViewController.swift
//  CustomTabBarTest
//
//  Created by ✨EUGENE✨ on 2021/08/31.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var categoryView: TabBarView!
    @IBOutlet weak var contentsCollectionView: UICollectionView!
    
    var tabVM = TabViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        tabCollectionView.dataSource = self
//        tabCollectionView.delegate = self
    }
//    override func viewWillAppear(_ animated: Bool) {
//        categoryTabUIView.set()
//    }
//    func register() {
//        let nib = UINib(nibName: "TabBarView", bundle: nil)
//        categoryView.register(nib, forCellWithReuseIdentifier: "TabBarView")
//    }
}

//extension ViewController: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return self.tabVM.numberOfItemsInSection()
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TabCollectionViewCell.identifier, for: indexPath) as? TabCollectionViewCell else {
//            return UICollectionViewCell()
//        }
//
//        cell.tabLabel.text = self.tabVM.tabTypes[indexPath.row]
//
//        return cell
//    }
//}
//
//extension ViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let cellHeight = collectionView.frame.height
//        let cellWidth = collectionView.frame.width / 6
//        return CGSize(width: cellWidth, height: cellHeight)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
//    }
//}
