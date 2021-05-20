//
//  WantCell.swift
//  CarouselEffectTest
//
//  Created by ✨EUGENE✨ on 2021/04/26.
//

import UIKit

class WantCell: UICollectionViewCell {

    static let identifier = "WantCell"
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var imageNames = ["blue", "trxye", "wild", "mymymy", "bloom", "nevernot", "paris", "feelings", "imfeeling", "superhero"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    func setupCollectionView() {

        let nib = UINib(nibName: "WantInnerCell", bundle: nil)
        self.collectionView?.register(nib, forCellWithReuseIdentifier: WantInnerCell.identifier)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}
extension WantCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNames.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WantInnerCell.identifier, for: indexPath) as! WantInnerCell
        cell.setCell(imageNames[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellHeight = collectionView.frame.height
        let cellWidth = (collectionView.frame.width - 20) / 4
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
    }
}
