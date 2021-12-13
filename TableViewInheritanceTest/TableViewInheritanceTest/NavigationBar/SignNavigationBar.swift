//
//  SignNavigationBar.swift
//  TableViewInheritanceTest
//
//  Created by elly on 2021/12/10.
//

import UIKit

class SignNavigationBar: NavigationBarView {
    
    /// 이미지 없어서 그냥 레이블로 테스트
    let rightImage = UILabel().then {
        $0.text = "로고"
    }
    
    override init() {
        super.init()
        
        self.addContentView()
        self.setAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addContentView() {
        self.addSubview(rightImage)
    }
    
    private func setAutoLayout() {
//        super.snp.remakeConstraints {
//            $0.width.equalTo(Util.deviceWidth)
//            $0.height.equalTo(60)
//        }
        rightImage.snp.makeConstraints {
            $0.centerY.equalTo(self)
            $0.right.equalTo(self).offset(-14)
        }
    }
}
