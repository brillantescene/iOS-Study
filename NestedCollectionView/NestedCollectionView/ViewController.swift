//
//  ViewController.swift
//  NestedCollectionView
//
//  Created by ✨EUGENE✨ on 2021/04/18.
//

import UIKit

class ViewController: UIViewController {

    let horizonInset: CGFloat = 20
    let lineSpacing: CGFloat = 10
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let collectionViewHorizonNib = UINib(nibName: "HorizonCVCell", bundle: nil)
        collectionView.register(collectionViewHorizonNib, forCellWithReuseIdentifier: "HorizonCVCell")
        let collectionViewHorizonNNib = UINib(nibName: "HoriNrrwCVCell", bundle: nil)
        collectionView.register(collectionViewHorizonNNib, forCellWithReuseIdentifier: "HoriNrrwCVCell")
        
        let collectionViewTitleNib = UINib(nibName: "TitleCRView", bundle: nil)
        collectionView.register(collectionViewTitleNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "TitleCRView")
        let collectionViewWideNib = UINib(nibName: "WideCVCell", bundle: nil)
        collectionView.register(collectionViewWideNib, forCellWithReuseIdentifier: "WideCVCell")
        collectionView.dataSource = self
        collectionView.delegate = self
    }


}

extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
     }
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        switch kind {
//        case UICollectionView.elementKindSectionHeader:
//            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: TitleCRView.identifier, for: indexPath)
//            return headerView
//        default: assert(false, "응 아니야")
//        }
//    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HorizonCVCell.identifier, for: indexPath) as? HorizonCVCell else {
                return UICollectionViewCell()
            }
                return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HoriNrrwCVCell.identifier, for: indexPath) as? HoriNrrwCVCell else {
                return UICollectionViewCell()
            }
                return cell
        }
        
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellHeight = collectionView.frame.height / 2
//        let cellWidth = (collectionView.frame.width - horizonInset) / 2
        let cellWidth = collectionView.frame.width
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0 }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0 }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: horizonInset, bottom: 0, right: horizonInset) }
}
