//
//  ViewController.swift
//  CustomTextFieldTest
//
//  Created by elly on 2021/12/09.
//

import UIKit

class ViewController: UIViewController {

    
    let firstTextField = CustomTextField()
    let secondTextField = CustomTextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(firstTextField)
        view.addSubview(secondTextField)
        
        firstTextField.snp.makeConstraints {
            $0.centerX.equalTo(view.safeAreaLayoutGuide)
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(100)
            $0.width.equalTo(200)
            $0.height.equalTo(50)
        }
        secondTextField.snp.makeConstraints {
            $0.centerX.equalTo(view.safeAreaLayoutGuide)
            $0.top.equalTo(firstTextField.snp.bottom).offset(30)
            $0.width.equalTo(200)
            $0.height.equalTo(50)
        }
        
        firstTextField.delegate = self
        secondTextField.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.firstTextField.endEditing(true)
        self.secondTextField.endEditing(true)
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case firstTextField:
            secondTextField.becomeFirstResponder()
        case secondTextField:
            secondTextField.resignFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        return true
    }
}
