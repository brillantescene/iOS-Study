//
//  WantInnerCell.swift
//  CarouselEffectTest
//
//  Created by ✨EUGENE✨ on 2021/05/06.
//

import UIKit

class WantInnerCell: UICollectionViewCell {

    static let identifier = "\(WantInnerCell.self)"
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var posterLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setCell(_ poster: String) {
        posterImage.layer.cornerRadius = 16
        posterImage.image = UIImage(named: poster)
        posterLabel.text = poster
    }
}
