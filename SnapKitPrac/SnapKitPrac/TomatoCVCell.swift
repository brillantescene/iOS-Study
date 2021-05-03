//
//  TomatoCVCell.swift
//  SnapKitPrac
//
//  Created by ✨EUGENE✨ on 2021/05/03.
//

import UIKit
import Then

class TomatoCVCell: UICollectionViewCell {
    
    static let identifier = "\(TomatoCVCell.self)"
    let main = UIView()
//        .then {
//        $0.backgroundColor = .red
//    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
        bindConstraints()
    }
    
    private func setup() {
        backgroundColor = .orange
        addSubview(main)
    }
    private func bindConstraints() {
        main.snp.makeConstraints {
            $0.edges.equalTo(0)
        }
    }
}
