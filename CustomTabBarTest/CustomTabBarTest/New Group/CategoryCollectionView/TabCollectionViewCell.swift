//
//  TabCollectionViewCell.swift
//  CustomTabBarTest
//
//  Created by ✨EUGENE✨ on 2021/08/31.
//

import UIKit

class TabCollectionViewCell: UICollectionViewCell {

    static let identifier = "TabCollectionViewCell"
    
    @IBOutlet weak var tabLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override var isSelected: Bool {
        didSet {
            tabLabel.font = isSelected ? UIFont.boldSystemFont(ofSize: 14) : UIFont.systemFont(ofSize: 14)
            tabLabel.textColor = isSelected ? .systemBlue : .gray
        }
    }
    
}
