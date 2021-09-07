//
//  ViewController.swift
//  ScrollViewTest
//
//  Created by ✨EUGENE✨ on 2021/09/07.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
//    @IBOutlet weak var pageControl: UIPageControl!
    
    let filterTypes: [String] = ["decaffeine", "soybeanMilk", "oatMilk", "lactofree"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButton()
    }

    func setButton() {
        for i in 0..<filterTypes.count {
            let filterButton = UIButton()
            filterButton.setImage(UIImage(named: filterTypes[i]+"_w"), for: .normal)
            filterButton.setImage(UIImage(named: filterTypes[i]+"_p"), for: .selected)
            filterButton.contentMode = .scaleAspectFit //  사진의 비율을 맞춤.
            let xPosition = self.view.frame.width * CGFloat(i) // 현재 보이는 스크린에서 하나의 이미지만 보이게 하기 위해
            
            filterButton.frame = CGRect(x: xPosition, y: 0, width: self.view.frame.width, height: self.view.frame.height)
            // 즉 이미지 뷰가 화면 전체를 덮게 됨.
            scrollView.contentSize.width = self.view.frame.width * CGFloat(1+i)
            // 이미지의 사이즈를 파악하고 해당 이미지를 올릴 수 있는 만큼 scroll view의 크기를 늘린 후
            scrollView.addSubview(filterButton)
            // 이미지를 scroll view에 붙인다.
        }
//        self.view.bringSubview(toFront: pageControl)
    }
    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//            let currentPage = round(scrollView.contentOffset.x / self.view.frame.width)
//            pageControl.currentPage = Int(CGFloat(currentPage))
//        }

}

