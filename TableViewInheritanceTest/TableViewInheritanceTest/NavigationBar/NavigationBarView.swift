//
//  navigationBarView.swift
//  TableViewInheritanceTest
//
//  Created by elly on 2021/12/10.
//

import UIKit
import Then
import SnapKit

class NavigationBarView: UIView {
    
    /// 이전으로 돌아가기 버튼
    private let previousButton = UIButton().then {
        $0.setTitle("이전", for: .normal)
        $0.titleLabel?.textColor = .black
    }
    
    /// 제목
    private let titleLabel = UILabel().then {
        $0.textAlignment = .center
        $0.font = .boldSystemFont(ofSize: 18)
        $0.textColor = .black
    }
    
    init() {
        super.init(frame: .zero)
        
        self.addContentView()
        self.setAutoLayout()
        self.backgroundColor = .systemBlue
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addContentView() {
        self.addSubview(previousButton)
        self.addSubview(titleLabel)
    }
    
    private func setAutoLayout() {
        
        self.snp.makeConstraints {
            $0.width.equalTo(Util.deviceWidth)
            $0.height.equalTo(50)
        }
        previousButton.snp.makeConstraints {
            $0.centerY.equalTo(self)
            $0.left.equalTo(self).offset(16)
        }
        titleLabel.snp.makeConstraints {
            $0.center.equalTo(self)
        }
    }
    
    func setTitle(_ title: String) {
        self.titleLabel.text = title
    }
}
