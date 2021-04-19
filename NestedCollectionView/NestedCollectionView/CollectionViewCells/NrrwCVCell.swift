//
//  NrrwCVCell.swift
//  NestedCollectionView
//
//  Created by ✨EUGENE✨ on 2021/04/19.
//

import UIKit

class NrrwCVCell: UICollectionViewCell {

    static let identifier = "NrrwCVCell"
    @IBOutlet weak var narrowView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        narrowView.layer.cornerRadius = 10
    }

}
