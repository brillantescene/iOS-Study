//
//  ViewController.swift
//  CustomTextFieldTest
//
//  Created by elly on 2021/12/09.
//

import UIKit

class ViewController: UIViewController {

    
    let firstTextField = CustomTextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(firstTextField)
        
        firstTextField.snp.makeConstraints {
            $0.center.equalTo(view.safeAreaLayoutGuide)
            $0.width.height.equalTo(100)
        }
    }


}

