//
//  LabelTextFieldView.swift
//  TableViewInheritanceTest
//
//  Created by elly on 2021/12/10.
//

import UIKit
import Then
import SnapKit

class LabelTextFieldView: UIView {
    
    static let identifier = "LabelTextFieldView"
    
    let titleLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 16)
        $0.textAlignment = .left
        $0.textColor = .black
    }
    
    let contentTextField = CustomTextField().then {
        $0.placeholder = "테스트 플레이스홀더"
    }
    
    init() {
        super.init(frame: .zero)
        
        self.addContentView()
        self.setAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addContentView() {
        self.addSubview(titleLabel)
        self.addSubview(contentTextField)
    }
    
    private func setAutoLayout() {
        
        self.snp.makeConstraints {
            $0.width.equalTo(Util.deviceWidth)
            $0.height.equalTo(90)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(self).offset(12)
            $0.left.equalTo(self).offset(37)
        }
        
        contentTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(6)
            $0.left.equalTo(self).offset(37)
            $0.right.equalTo(self).offset(-36)
            $0.bottom.equalTo(self).offset(-6)
            $0.height.equalTo(47)
        }
        
    }
    
    func bind() {
        self.titleLabel.text = "비밀번호"
//        self.contentTextField.placeholder = "테슷ㅅ트"
    }
}
