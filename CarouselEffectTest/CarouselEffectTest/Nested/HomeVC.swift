//
//  HomeVC.swift
//  CarouselEffectTest
//
//  Created by ✨EUGENE✨ on 2021/04/26.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
        
        layout?.sectionHeadersPinToVisibleBounds = true
        
        profileImage.layer.cornerRadius = profileImage.frame.height / 2
        
        let attributedString = NSMutableAttributedString()
            .bold("유진 ", fontSize: 22)
            .normal("님의\n토마토 로그", fontSize: 22)
        nickNameLabel.attributedText = attributedString
        nickNameLabel.numberOfLines = 2
//        let headerNib = UINib(nibName: "HeaderCell", bundle: nil)
//        self.collectionView?.register(headerNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCell.identifier)
        

        let tomatoNib = UINib(nibName: "TomatoCell", bundle: nil)
        self.collectionView?.register(tomatoNib, forCellWithReuseIdentifier: "TomatoCell")
        
        let wantNib = UINib(nibName: "WantCell", bundle: nil)
        self.collectionView?.register(wantNib, forCellWithReuseIdentifier: "WantCell")
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}
extension HomeVC: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//
////        if indexPath.section == 0 && kind == UICollectionView.elementKindSectionHeader {
////
////        }
//        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCell.identifier, for: indexPath) as? HeaderCell else {
//            return UICollectionReusableView()
//        }
//        return header
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        if section == 0 {
//            return CGSize(width: collectionView.bounds.width, height: 153)
//        }
//        return .zero
//    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TomatoCell.identifier, for: indexPath) as? TomatoCell else {
                return UICollectionViewCell()
            }
            cell.setupCollectionView()
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WantCell.identifier, for: indexPath) as? WantCell else {
                return UICollectionViewCell()
            }
            cell.setupCollectionView()
            return cell
        }
    }
}
extension HomeVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellHeight = collectionView.frame.height
//        let cellWidth = (collectionView.frame.width - horizonInset) / 2
        let cellWidth = collectionView.frame.width
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0 }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0 }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0) }
}
