//
//  CategoryUIVIew.swift
//  UIViewAnimationTest
//
//  Created by ✨EUGENE✨ on 2021/11/04.
//

import UIKit
import Then
import SnapKit

class CategoryUIVIew: UIViewController {
    
//    let label = UILabel().then {
//        $0.text = "안뇽"
//    }
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//    }
//
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//    }
    
    let newView = UIView().then {
        $0.backgroundColor = .white
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("hi")
        
        let safeArea = view.safeAreaLayoutGuide
        
        view.addSubview(newView)
        
        newView.snp.makeConstraints {
            $0.center.equalTo(safeArea)
            $0.width.height.equalTo(300)
        }
    }
    
    
}
