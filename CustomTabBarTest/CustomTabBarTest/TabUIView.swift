//
//  TabUIView.swift
//  CustomTabBarTest
//
//  Created by ✨EUGENE✨ on 2021/11/20.
//

import UIKit
import Then
import SnapKit

class TabUIView: UIView {
    
    let WIDTH = UIScreen.main.bounds.width
    let HEIGHT = 29
    
    let firstTabLabel = UILabel().then {
        $0.text = "내가 쓴 흔적"
        $0.textColor = .blue
    }
    
    let secondTabLabel = UILabel().then {
        $0.text = "내가 쓴 흔적"
        $0.textColor = .red
    }
    
    let firstUnderBar = UIView().then {
        $0.backgroundColor = .blue
    }
    
    let secondUnderBar = UIView().then {
        $0.backgroundColor = .red
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
        self.addSubview(firstTabLabel)
        self.addSubview(firstUnderBar)
        self.addSubview(secondTabLabel)
        self.addSubview(secondUnderBar)
    }
    
    private func setAutoLayout() {
        self.snp.makeConstraints {
            $0.width.equalTo(self.WIDTH)
            $0.height.equalTo(self.HEIGHT)
        }
        firstTabLabel.snp.makeConstraints {
            $0.top.equalTo(self)
            $0.left.equalTo(self).offset(20)
        }
        firstUnderBar.snp.makeConstraints {
            $0.bottom.equalTo(self)
            $0.left.equalTo(firstTabLabel.snp.left)
            $0.width.equalTo(firstTabLabel.snp.width)
            $0.height.equalTo(2)
        }
        secondTabLabel.snp.makeConstraints {
            $0.top.equalTo(self)
            $0.left.equalTo(self).offset(self.WIDTH / 2)
        }
        secondUnderBar.snp.makeConstraints {
            $0.bottom.equalTo(self)
            $0.left.equalTo(secondTabLabel.snp.left)
            $0.width.equalTo(firstTabLabel.snp.width)
            $0.height.equalTo(2)
        }
    }
}
