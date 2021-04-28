//
//  TomatoInnerCell.swift
//  CarouselEffectTest
//
//  Created by ✨EUGENE✨ on 2021/04/26.
//

import UIKit

class TomatoInnerCell: UICollectionViewCell {

    static let identifier = "TomatoInnerCell"
    
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var albumNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        setShadow()
        
    }
    func setShadow() {
        view.layer.cornerRadius = 15
        view.layer.masksToBounds = false
        view.layer.applySketchShadow(color: UIColor.black, alpha: 0.1, x: 0, y: 4, blur: 34, spread: 0)
        view.layer.shadowPath = UIBezierPath(rect: view.bounds).cgPath
    }
    func setCell(_ imageName: String) {
        
        imageView.layer.cornerRadius = 15
        imageView.image = UIImage(named: imageName)
        albumNameLabel.text = imageName
    }
}
