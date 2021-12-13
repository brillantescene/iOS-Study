//
//  ViewController.swift
//  TableViewInheritanceTest
//
//  Created by elly on 2021/12/10.
//

import UIKit
import Then
import SnapKit

class ViewController: UIViewController {

    let titleBar = SignNavigationBar().then {
        $0.setTitle("테스트")
    }
    
    let signUpView = SignUpView().then {
        $0.setTitle("테슷드")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let safeArea = view.safeAreaLayoutGuide
        
        view.addSubview(titleBar)
        view.addSubview(signUpView)
        
        titleBar.snp.makeConstraints {
            $0.top.left.right.equalTo(safeArea)
        }
        signUpView.snp.makeConstraints {
            $0.top.equalTo(titleBar.snp.bottom)
            $0.left.right.bottom.equalTo(safeArea)
        }
        
        signUpView.emailView.contentTextField.delegate = self
        signUpView.passwordView.contentTextField.delegate = self
        
    }


}
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
            case signUpView.emailView.contentTextField:
                signUpView.passwordView.contentTextField.becomeFirstResponder()
            case signUpView.passwordView.contentTextField:
                signUpView.passwordView.contentTextField.resignFirstResponder()
            default:
                textField.resignFirstResponder()
        }
        
        return true
    }
}
