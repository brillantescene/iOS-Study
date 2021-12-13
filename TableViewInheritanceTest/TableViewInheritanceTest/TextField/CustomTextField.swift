//
//  CustomTextField.swift
//  CustomTextFieldTest
//
//  Created by elly on 2021/12/09.
//

import UIKit
import Then
import SnapKit

class CustomTextField: UITextField {
    
    /// 탭하면 키보드 올라옴
    lazy var tapRecognizer = UITapGestureRecognizer().then {
        $0.addTarget(self, action: #selector(becomeFirstResponder))
    }
    
    init() {
        super.init(frame: .zero)
        
        addGestureRecognizer(tapRecognizer)
        self.addPadding()
        
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 4
        self.layer.borderColor = CGColor(gray: 0.5, alpha: 1)
        
        self.addTarget(self, action: #selector(activate), for: .editingDidBegin)
        self.addTarget(self, action: #selector(deactivate), for: .editingDidEnd)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    func activate() {
        self.layer.borderColor = UIColor(named: "main")?.cgColor
    }
    
    @objc
    func deactivate() {
        self.layer.borderColor = CGColor(gray: 0.5, alpha: 1)
    }
}
