//
//  ViewController.swift
//  UIViewAnimationTest
//
//  Created by ✨EUGENE✨ on 2021/11/04.
//

import UIKit
import Then
import SnapKit

class ViewController: UIViewController {
    
    let topView = UIView().then {
        $0.backgroundColor = .white
    }
    
    let topLabel = UILabel().then {
        $0.text = "어디 한번 가보자고"
    }
    
    let topButton = UIButton().then {
        $0.backgroundColor = .clear
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addContentView()
        setAutoLayout()
        setAction()
    }


    func addContentView() {
        view.addSubview(topView)
        topView.addSubview(topLabel)
        topView.addSubview(topButton)
    }
    
    func setAutoLayout() {
        
        let safeArea = view.safeAreaLayoutGuide
        
        topView.snp.makeConstraints {
            $0.top.equalTo(safeArea).offset(100)
            $0.left.equalTo(safeArea).offset(20)
            $0.right.equalTo(safeArea).offset(-20)
            $0.height.equalTo(50)
        }
        
        topLabel.snp.makeConstraints {
            $0.center.equalTo(topView)
        }
        
        topButton.snp.makeConstraints {
            $0.top.left.right.bottom.equalTo(topView)
        }
    }
    
    func setAction() {
        topButton.addTarget(self, action: #selector(tapTopButton), for: .touchUpInside)
    }
    
    @objc func tapTopButton(_ sender:UIButton) {
        print("누름")
        
    }
}

