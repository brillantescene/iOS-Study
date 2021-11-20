//
//  TabCell.swift
//  CustomTabBarTest
//
//  Created by ✨EUGENE✨ on 2021/11/21.
//

import UIKit
import Then
import SnapKit

class TabCell: UICollectionViewCell {
    
    static let identifier = "TabCell"
    
    let WIDTH = UIScreen.main.bounds.width / 2
    let HEIGHT = 29
    
    let tabLabel = UILabel().then {
        $0.text = "내가 쓴 흔적"
        $0.textColor = .gray
    }
    let underBar = UIView().then {
        $0.backgroundColor = .blue
        $0.isHidden = true
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        addContentView()
        setAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func addContentView() {
        self.addSubview(tabLabel)
        self.addSubview(underBar)
    }
    
    private func setAutoLayout() {
        self.snp.makeConstraints {
            $0.width.equalTo(self.WIDTH)
            $0.height.equalTo(self.HEIGHT)
        }
        tabLabel.snp.makeConstraints {
            $0.top.equalTo(self)
            $0.left.equalTo(self).offset(20)
        }
        underBar.snp.makeConstraints {
            $0.bottom.equalTo(self)
            $0.left.equalTo(tabLabel.snp.left)
            $0.width.equalTo(tabLabel.snp.width)
            $0.height.equalTo(2)
        }
    }
}
