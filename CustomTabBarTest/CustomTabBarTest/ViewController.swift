//
//  ViewController.swift
//  CustomTabBarTest
//
//  Created by ✨EUGENE✨ on 2021/08/31.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var categoryView: TabBarView!
    @IBOutlet weak var contentsCollectionView: UICollectionView!
    
    var tabVM = TabViewModel()
//    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryView.delegate = self
        
        contentsCollectionView.dataSource = self
        contentsCollectionView.delegate = self
        contentsCollectionView.isPagingEnabled = true
        
        contentsCollectionView.register(UINib(nibName: "TabCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TabCollectionViewCell")
    }
}
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TabCollectionViewCell.identifier, for: indexPath) as? TabCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.tabLabel.text = self.tabVM.tabTypes[indexPath.row]
        return cell
    }
    
    
}
extension ViewController: UICollectionViewDelegate {
    // 스크롤이 실행될 때, IndicatorView를 움직임
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        categoryTabbarView.indicatorLeadingConstarint.constant = scrollView.contentOffset.x / 2
//    }
    
    // 스크롤이 끝났을 때, 페이지를 계산해서 Tab을 이동시킴
//    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
//        let page = Int(targetContentOffset.pointee.x / scrollView.frame.width)
//        categoryView.scroll(to: page)
//    }
}
extension ViewController: PagingTabbarDelegate {
    // 탭바를 클릭했을 때, 콘텐츠 뷰 이동
    func scrollToIndex(to index: Int) {
        print("hi contents \(self.tabVM.tabTypes[index])")
        contentsCollectionView.scrollToItem(at: IndexPath(row: index, section: 0), at: .centeredHorizontally, animated: true)
    }
}
extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        print(collectionView.frame.height, collectionView.frame.width)
        return CGSize(width: collectionView.frame.height, height: collectionView.frame.width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
