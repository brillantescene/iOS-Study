//
//  WideCVCell.swift
//  NestedCollectionView
//
//  Created by ✨EUGENE✨ on 2021/04/18.
//

import UIKit

class WideCVCell: UICollectionViewCell {

    static let identifier = "WideCVCell"
    @IBOutlet weak var wideView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        wideView.layer.cornerRadius = 10
    }

}
