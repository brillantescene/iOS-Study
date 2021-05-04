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
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: CarouselLayout()).then {
        let layout = CarouselLayout()
        layout.itemSize = CGSize(width: 154, height: 205)
        layout.sideItemScale = 0.77
        layout.spacing = 20
        layout.isPagingEnabled = true
        layout.scrollDirection = .horizontal
        
        $0.backgroundColor = .white
        $0.collectionViewLayout = layout
        $0.layer.masksToBounds = false
    }
    
    var imageNames = ["blue", "trxye", "wild", "mymymy", "bloom", "nevernot", "paris", "feelings", "imfeeling", "superhero"]
    
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
        backgroundColor = .white
        addSubview(collectionView)
        
        collectionView.register(TomatoInnerCell.self, forCellWithReuseIdentifier: TomatoInnerCell.identifier)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    private func bindConstraints() {
        collectionView.snp.makeConstraints {
            $0.edges.equalTo(0)
        }
    }
}
extension TomatoCVCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return imageNames.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TomatoInnerCell.identifier, for: indexPath) as! TomatoInnerCell
        cell.setCell(imageNames[indexPath.row])
//        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "index"), object: imageNames[indexPath.row])
//        cell.setShadow()
        cell.layer.masksToBounds = false
        return cell
    }
}
extension TomatoCVCell : UIScrollViewDelegate {
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        // item의 사이즈와 item 간의 간격 사이즈를 구해서 하나의 item 크기로 설정.
        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
        
        // targetContentOff을 이용하여 x좌표가 얼마나 이동했는지 확인
        // 이동한 x좌표 값과 item의 크기를 비교하여 몇 페이징이 될 것인지 값 설정
        var offset = targetContentOffset.pointee
        let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludingSpacing
        var roundedIndex = round(index)
        
        // scrollView, targetContentOffset의 좌표 값으로 스크롤 방향을 알 수 있다.
        // index를 반올림하여 사용하면 item의 절반 사이즈만큼 스크롤을 해야 페이징이 된다.
        // 스크로로 방향을 체크하여 올림,내림을 사용하면 좀 더 자연스러운 페이징 효과를 낼 수 있다.
        if scrollView.contentOffset.x > targetContentOffset.pointee.x {
            roundedIndex = floor(index)
        } else if scrollView.contentOffset.x < targetContentOffset.pointee.x {
            roundedIndex = ceil(index)
        } else {
            roundedIndex = round(index)
        }
        
        // 한 칸씩 이동 가능
//        if currentIndex > roundedIndex {
//            currentIndex -= 1
//            roundedIndex = currentIndex
//        } else if currentIndex < roundedIndex {
//            currentIndex += 1
//            roundedIndex = currentIndex
//        }
        
        // 위 코드를 통해 페이징 될 좌표값을 targetContentOffset에 대입하면 된다.
        offset = CGPoint(x: roundedIndex * cellWidthIncludingSpacing - scrollView.contentInset.left, y: -scrollView.contentInset.top)
        targetContentOffset.pointee = offset
        
//        if Int(roundedIndex) >= imageNames.count {
//            imageView.image = UIImage(named: imageNames.last!)
//        } else {
//            imageView.image = UIImage(named: imageNames[Int(roundedIndex)])
//        }
        
//        imageView.image = UIImage(named: imageNames[Int(currentIndex)])
    }
}
