//
//  BasicView.swift
//  TableViewInheritanceTest
//
//  Created by elly on 2021/12/10.
//

import UIKit
import Then
import SnapKit

class BasicView: UIView {
    
    let titleLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 26)
        $0.textAlignment = .left
        $0.textColor = .black
    }
    
    let scrollView = UIScrollView().then {
        $0.showsVerticalScrollIndicator = false
    }
    let stackView = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .fill
        $0.spacing = 0
    }
    
    private let doneButton = UIButton().then {
        $0.backgroundColor = .systemIndigo
        $0.layer.cornerRadius = 25
        $0.setTitle("확인", for: .normal)
        $0.titleLabel?.textColor = .black
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
        self.addSubview(scrollView)
        scrollView.addSubview(stackView)
        self.addSubview(doneButton)
    }
    
    private func setAutoLayout() {
        
        self.snp.makeConstraints {
            $0.width.equalTo(Util.deviceWidth)
            $0.height.equalTo(Util.deviceHeight)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(self).offset(22)
            $0.left.equalTo(self).offset(37)
        }
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(14)
            $0.left.right.equalTo(self)
            $0.bottom.equalTo(doneButton.snp.top).offset(10)
        }
        stackView.snp.makeConstraints {
            $0.top.equalTo(scrollView)
            $0.left.right.bottom.equalTo(scrollView)
        }
        
        doneButton.snp.makeConstraints {
            $0.centerX.equalTo(self)
            $0.left.equalTo(self).offset(29)
            $0.right.equalTo(self).offset(-29)
            $0.bottom.equalTo(self).offset(-47)
            $0.height.equalTo(50)
        }
    }
    
    /// remakeConstraints 함수
    
    func setTitle(_ title: String) {
        self.titleLabel.text = title
    }
}
