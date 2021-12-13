//
//  ButtonTextField.swift
//  TableViewInheritanceTest
//
//  Created by elly on 2021/12/10.
//

import UIKit
import Then
import SnapKit

final class ButtonTextField: CustomTextField {
    
    /// 탭하면 키보드 올라옴
//    private lazy var tapRecognizer = UITapGestureRecognizer().then {
//        $0.addTarget(self, action: #selector(becomeFirstResponder))
//    }
    
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
            $0.centerY.equalTo(self)
            $0.right.equalTo(self).offset(-13)
            $0.width.height.equalTo(10)
        }
    }
}
