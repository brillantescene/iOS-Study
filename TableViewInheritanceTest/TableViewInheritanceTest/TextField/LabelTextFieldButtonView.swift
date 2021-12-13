//
//  LabelTextFieldButtonView.swift
//  TableViewInheritanceTest
//
//  Created by elly on 2021/12/10.
//

import UIKit
import Then
import SnapKit

class LabelTextFieldButtonView: LabelTextFieldView {
    
    let rightButton = UIButton().then {
        $0.setTitle("버튼", for: .normal)
        $0.titleLabel?.textColor = .black
        $0.backgroundColor = .blue
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
        self.addSubview(rightButton)
    }
    
    private func setAutoLayout() {
        
        rightButton.snp.makeConstraints {
            $0.centerY.equalTo(super.contentTextField)
            $0.right.equalTo(super.contentTextField.snp.right).offset(-13)
            $0.width.height.equalTo(10)
        }
    }
}
