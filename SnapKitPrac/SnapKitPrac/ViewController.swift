//
//  ViewController.swift
//  SnapKitPrac
//
//  Created by ✨EUGENE✨ on 2021/05/01.
//

import UIKit
import SnapKit
import Then

class ViewController: UIViewController {
    
    let profileImageView = UIImageView()
    let logLabel = UILabel()
    let collectionView = UICollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        setAutoLayout()
        setLabel()
    }
}
extension ViewController {
    func setView() {
        profileImageView.then {
            $0.image = UIImage(named: "blue")
            
            $0.contentMode = .scaleAspectFill
            $0.layer.cornerRadius = 10//$0.frame.height / 2
        }
        logLabel.then {
            $0.text = "유진 님의\n토마토 로그"
            $0.font = UIFont.systemFont(ofSize: 22)
            $0.textAlignment = .left
            $0.numberOfLines = 2
        }
//        collectionView.then {
//
//        }
        view.addSubview(profileImageView)
        view.addSubview(logLabel)
    }
    
    func setAutoLayout() {
        let safeArea = view.safeAreaLayoutGuide
        
        profileImageView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(safeArea).offset(14)
            make.left.equalTo(safeArea).offset(27)
            make.size.equalTo(CGSize(width: 37, height: 37))
        }
        logLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(profileImageView).offset(23)
            make.left.equalTo(safeArea).offset(20)
            make.height.equalTo(104)
        }
    }
    
    func setLabel() {
        let fontSize = UIFont.boldSystemFont(ofSize: 22)
        let attributedStr = NSMutableAttributedString(string: logLabel.text!)
        attributedStr.addAttribute(.font, value: fontSize, range: (logLabel.text! as NSString).range(of: "유진"))
        logLabel.attributedText = attributedStr
    }
}
