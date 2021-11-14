//
//  MarkerImageView.swift
//  mapKitTest
//
//  Created by ✨EUGENE✨ on 2021/11/14.
//

import UIKit
import Then
import SnapKit

class MarkerImageView: UIImageView {
    let label = UILabel().then {
        $0.text = "👀"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setLayout() {
        self.addSubview(label)
        self.image = UIImage(named: "gogog")
        self.snp.makeConstraints {
            $0.width.height.equalTo(56)
        }
        
        label.snp.makeConstraints {
            $0.top.equalTo(self).offset(5)
            $0.left.equalTo(self).offset(7)
        }
    }
}
