//
//  TomatoInnerCell.swift
//  SnapKitPrac
//
//  Created by ✨EUGENE✨ on 2021/05/04.
//

import UIKit
import Then
import SnapKit

class TomatoInnerCell: UICollectionViewCell {
    static let identifier = "\(TomatoInnerCell.self)"
    
    let baseView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 15
    }
    
    let imageView = UIImageView()
    let albumLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setup() {
        let safeArea = safeAreaLayoutGuide//layoutGuides
        backgroundColor = .clear
        addSubview(baseView)
        addSubview(imageView)
        addSubview(albumLabel)
        
        baseView.snp.makeConstraints {
            $0.left.right.bottom.equalTo(0)
            $0.top.equalToSuperview().offset(20)
        }
        imageView.snp.makeConstraints {
            $0.top.equalTo(safeArea)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(CGSize(width: 112, height: 161))
        }
        albumLabel.snp.makeConstraints {
            $0.top.equalTo(imageView).offset(9)
            $0.left.equalToSuperview().offset(15)
        }
        
        baseView.layer.masksToBounds = false
        baseView.layer.applySketchShadow(color: UIColor.black, alpha: 0.1, x: 0, y: 4, blur: 34, spread: 0)
        baseView.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
    }
    func setCell(_ imageName: String) {
        imageView.layer.cornerRadius = 15
        imageView.image = UIImage(named: imageName)
        albumLabel.text = imageName
    }
}
