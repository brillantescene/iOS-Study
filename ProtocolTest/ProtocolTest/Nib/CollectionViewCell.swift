//
//  CollectionViewCell.swift
//  ProtocolTest
//
//  Created by ✨EUGENE✨ on 2021/04/21.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    static let identifier = "CollectionViewCell"
    
    @IBOutlet weak var rectangle: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // 원래 여기다 안쓰고 따로 func 두는데 그냥 이렇게 하겠음
        rectangle.layer.cornerRadius = 10
    }
}
