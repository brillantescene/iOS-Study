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
    
    private lazy var mainView = MainView.init(frame: self.view.frame)
    
    static func instance() -> ViewController {
            return ViewController.init(nibName: nil, bundle: nil)
        }
    let profileImageView = UIImageView().then {
        $0.image = UIImage(named: "blue")
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = $0.frame.height / 2
    }
    let logLabel = UILabel().then {
        $0.text = "유진 님의\n토마토 로그"
        $0.font = UIFont.systemFont(ofSize: 22)
        $0.textAlignment = .left
        $0.numberOfLines = 2
    }
    let tomatoImageView = UIImageView().then {
        $0.image = UIImage(named: "feelings")
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = $0.frame.height / 2
    }
//    let collectionView = UICollectionView().then {
//        $0.register(TomatoCVCell.self, forCellWithReuseIdentifier: TomatoCVCell.identifier)
//        $0.backgroundColor = .orange
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        setView()
        setLabel()
        setUpCollectionView()
        
        
    }
}
extension ViewController {
    private func setUpCollectionView() {
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
        mainView.collectionView.register(TomatoCVCell.self, forCellWithReuseIdentifier: TomatoCVCell.identifier)
        mainView.collectionView.snp.makeConstraints {
            $0.top.equalTo(tomatoImageView.snp.bottom)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(200)
        }
    }
    private func setView() {
        let safeArea = view.safeAreaLayoutGuide
        view.addSubview(profileImageView)
        view.addSubview(logLabel)
        view.addSubview(tomatoImageView)
        
        profileImageView.snp.makeConstraints {
            $0.top.equalTo(safeArea).offset(14)
            $0.left.equalTo(safeArea.snp.left).offset(27)
            $0.size.equalTo(CGSize(width: 37, height: 37))
        }
        logLabel.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.bottom).offset(23)
            $0.left.equalTo(safeArea).offset(20)
            $0.height.equalTo(104)
        }
        tomatoImageView.snp.makeConstraints {
            $0.top.equalTo(logLabel.snp.bottom).offset(15)
            $0.centerX.equalTo(safeArea)
            $0.size.equalTo(CGSize(width: 125, height: 125))
        }
    }
    func setLabel() {
        let fontSize = UIFont.boldSystemFont(ofSize: 22)
        let attributedStr = NSMutableAttributedString(string: logLabel.text!)
        attributedStr.addAttribute(.font, value: fontSize, range: (logLabel.text! as NSString).range(of: "유진"))
        logLabel.attributedText = attributedStr
    }
}
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TomatoCVCell.identifier, for: indexPath) as? TomatoCVCell else {
            return UICollectionViewCell()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width / 3), height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10 }
}
