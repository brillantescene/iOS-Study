//
//  ContentsCollectionViewCell.swift
//  CustomTabBarTest
//
//  Created by ✨EUGENE✨ on 2021/09/01.
//

import UIKit

class ContentsCollectionViewCell: UICollectionViewCell {

    static let identifier = "ContentsCollectionViewCell"
    @IBOutlet weak var textLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setCell(str: String) {
        self.textLabel.text = str
    }
}
