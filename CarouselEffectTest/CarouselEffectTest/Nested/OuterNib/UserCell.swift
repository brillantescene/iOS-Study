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
    @IBOutlet weak var nickNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        profileImage.layer.cornerRadius = profileImage.frame.height / 2
    }

    func setUserName(_ nickName: String) {
        let attributedString = NSMutableAttributedString()
            .bold("\(nickName) ", fontSize: 22)
            .normal("님의\n토마토 로그", fontSize: 22)
        nickNameLabel.attributedText = attributedString
        nickNameLabel.numberOfLines = 2
    }
}
