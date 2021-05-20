//
//  CarouselLayout.swift
//  CarouselEffectTest
//
//  Created by ✨EUGENE✨ on 2021/04/23.
//

import UIKit

class CarouselLayout: UICollectionViewFlowLayout {

    public var sideItemScale: CGFloat = 0
    public var spacing: CGFloat = 0

    public var isPagingEnabled: Bool = false
    
    private var isSetup: Bool = false
    
    override public func prepare() {
        super.prepare()
        if isSetup == false {
            setupLayout()
            isSetup = true
        }
    }
    private func setupLayout() {
        guard let collectionView = self.collectionView else {return}
                
        let collectionViewSize = collectionView.bounds.size
        
        let xInset = (collectionViewSize.width - self.itemSize.width) / 2
        let yInset = (collectionViewSize.height - self.itemSize.height) / 2
        
        print("collectionViewSize.width \(collectionViewSize.width) self.itemSize.width \(self.itemSize.width)")
        print("collectionViewSize.height \(collectionViewSize.height) self.itemSize.height \(self.itemSize.height)")
        print("xInset \(xInset) yInset \(yInset)")
        
        self.sectionInset = UIEdgeInsets(top: yInset, left: xInset, bottom: yInset, right: xInset)
        let itemWidth = self.itemSize.width
        
        let scaledItemOffset =  (itemWidth - itemWidth*self.sideItemScale) / 2
        self.minimumLineSpacing = spacing - scaledItemOffset

        self.scrollDirection = .horizontal
    }
    // Bounds 변화가 있을 때마다 레이아웃 업데이트가 필요한지. true
    public override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    // 셀을 표시할 때 사용하는 함수
    // 특정 사각형에 있는 모든 셀과 뷰에 대한 레이아웃 요소를 검색, UICollectionViewLayoutAttributes 배열로 변화
    public override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let superAttributes = super.layoutAttributesForElements(in: rect),
            let attributes = NSArray(array: superAttributes, copyItems: true) as? [UICollectionViewLayoutAttributes]
            else { return nil }
        
        return attributes.map({ self.transformLayoutAttributes(attributes: $0) })
    }
    
    private func transformLayoutAttributes(attributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        
        guard let collectionView = self.collectionView else {return attributes}
        
        let collectionCenter = collectionView.frame.size.width / 2
        let contentOffset = collectionView.contentOffset.x
        let center = attributes.center.x - contentOffset
        
        let maxDistance = self.itemSize.width + self.minimumLineSpacing
        let distance = min(abs(collectionCenter - center), maxDistance)
        
        let ratio = (maxDistance - distance)/maxDistance
        
        let scale = ratio * (1 - self.sideItemScale) + self.sideItemScale
        print("\(scale)")
        let visibleRect = CGRect(origin: collectionView.contentOffset, size: collectionView.bounds.size)
        let dist = attributes.frame.midX - visibleRect.midX
        var transform = CATransform3DScale(CATransform3DIdentity, scale, scale, 1)
        transform = CATransform3DTranslate(transform, 0, 0, -abs(dist/1000))
        attributes.transform3D = transform
        
        return attributes
    }
}

