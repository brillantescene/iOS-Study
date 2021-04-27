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
        let layer2 = CALayer(layer: layer)
        view.layer.cornerRadius = 12
        view.layer.masksToBounds = false
        
        layer2.applySketchShadow(color: UIColor.black, alpha: 0.1, x: 0, y: 4, blur: 34, spread: 0)
        view.layer.insertSublayer(layer2, at: 0)
        view.layer.sublayers?.forEach { (sublayer) in
            sublayer.shadowPath = UIBezierPath(rect: bounds).cgPath
        }
        
        imageView.layer.cornerRadius = 12
        imageView.image = UIImage(named: imageName)
    }
}
