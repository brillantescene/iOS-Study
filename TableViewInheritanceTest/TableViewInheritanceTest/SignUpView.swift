//
//  SignUpView.swift
//  TableViewInheritanceTest
//
//  Created by elly on 2021/12/10.
//

import UIKit
import Then
import SnapKit

class SignUpView: BasicView {
    
    let emailView = LabelTextFieldView().then {
        $0.bind()
    }
    
    let passwordView = LabelTextFieldButtonView().then {
        $0.bind()
    }
    
    let test1 = LabelTextFieldButtonView().then {
        $0.bind()
    }
    
    let test2 = LabelTextFieldButtonView().then {
        $0.bind()
    }
    
    let test3 = LabelTextFieldButtonView().then {
        $0.bind()
    }
    
    let test4 = LabelTextFieldButtonView().then {
        $0.bind()
    }
    
    let test5 = LabelTextFieldButtonView().then {
        $0.bind()
    }
    
    let test6 = LabelTextFieldButtonView().then {
        $0.bind()
    }
    
    let test7 = LabelTextFieldButtonView().then {
        $0.bind()
    }
    override init() {
        super.init()
        self.addContentView()
        self.setAutoLayout()
        super.setTitle("이메일 회원가입")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addContentView() {
        
        super.stackView.addArrangedSubview(emailView)
        super.stackView.addArrangedSubview(passwordView)
        super.stackView.addArrangedSubview(test1)
        super.stackView.addArrangedSubview(test2)
        super.stackView.addArrangedSubview(test3)
        super.stackView.addArrangedSubview(test4)
        super.stackView.addArrangedSubview(test5)
        super.stackView.addArrangedSubview(test6)
        super.stackView.addArrangedSubview(test7)
//        self.addSubview(emailView)
//        self.addSubview(passwordView)
    }
    
    private func setAutoLayout() {
        
//        emailView.snp.makeConstraints {
//            $0.top.equalTo(super.titleLabel.snp.bottom).offset(14)
//            $0.left.right.equalTo(self)
//        }
//        passwordView.snp.makeConstraints {
//            $0.top.equalTo(emailView.snp.bottom)
//            $0.left.right.equalTo(self)
//        }
    }
    
    /// remakeConstraints 함수
    
//    func setTitle(_ title: String) {
//        self.titleLabel.text = title
//    }
}
