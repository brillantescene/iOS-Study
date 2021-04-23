//
//  CollectionViewCell.swift
//  CarouselEffectTest
//
//  Created by ✨EUGENE✨ on 2021/04/23.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    static let identifier = "CollectionViewCell"
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var view: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setCell(_ imageName: String) {
        view.layer.cornerRadius = 12
        imageView.layer.cornerRadius = 12
        imageView.image = UIImage(named: imageName)
    }
}
