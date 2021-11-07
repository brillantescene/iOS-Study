//
//  OneTimeCodeTextField.swift
//  TextFieldTest
//
//  Created by ✨EUGENE✨ on 2021/11/07.
//

import UIKit

class OneTimeCodeTextField: UITextField {
    
    private var isConfigured = false // configure함수 한번만 호출하기 위함

    private var digitLabels = [UILabel]()
    
    // 인증번호 자릿수
    func configure(with slotCount: Int = 6) {
        guard isConfigured == false else { return }
        isConfigured.toggle() // false -> true
        
        configureTextField()
    }
    
    // textfield 설정
    private func configureTextField() {
        tintColor = .clear
        textColor = .clear
        keyboardType = .numberPad
        textContentType = .oneTimeCode
    }
    
    // 스택뷰
    private func createLabelsStackView(with count: Int) -> UIStackView {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false //autolayout
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        
        
        for _ in 1...count {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textAlignment = .center
            label.font = .systemFont(ofSize: 40)
            label.backgroundColor = .blue
            
            stackView.addArrangedSubview(label)
            
            digitLabels.append(label)
        }
        return stackView
    }
}
