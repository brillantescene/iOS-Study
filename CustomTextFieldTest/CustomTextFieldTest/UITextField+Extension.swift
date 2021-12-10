//
//  UITextField+Extension.swift
//  CustomTextFieldTest
//
//  Created by elly on 2021/12/10.
//

import UIKit

extension UITextField {
    
    /// textField 왼쪽 내부 패딩 설정
    func addPadding(left: CGFloat = 19) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: left, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}
