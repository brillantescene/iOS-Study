//
//  UserCell.swift
//  CarouselEffectTest
//
//  Created by ✨EUGENE✨ on 2021/04/27.
//

import UIKit

class UserCell: UICollectionViewCell {

    static let identifier = "UserCell"
    
    @IBOutlet weak var profileImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        profileImage.layer.cornerRadius = profileImage.frame.height / 2
    }

}
