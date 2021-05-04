//
//  MainView.swift
//  SnapKitPrac
//
//  Created by ✨EUGENE✨ on 2021/05/03.
//

import UIKit

class MainView: UIView {
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
            let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical//.horizontal
            
            $0.backgroundColor = .black
            $0.contentInset = UIEdgeInsets.init(top: 0, left: 20, bottom: 0, right: 0)
            $0.showsHorizontalScrollIndicator = false
            $0.collectionViewLayout = layout
        }
        
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            setup()
//            bindConstraints()
        }
        
        required init?(coder: NSCoder) {
            super.init(coder: coder)
            setup()
//            bindConstraints()
        }
        
        func setup() {
            backgroundColor = .white
            addSubview(collectionView)
        }
        
//        func bindConstraints() {
//            collectionView.snp.makeConstraints { (make) in
//                make.left.right.equalToSuperview()
//                make.centerY.equalToSuperview()
//                make.height.equalTo(200)
//            }
//        }
}
