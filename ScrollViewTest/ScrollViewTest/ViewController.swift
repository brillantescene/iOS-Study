//
//  ViewController.swift
//  ScrollViewTest
//
//  Created by ✨EUGENE✨ on 2021/09/07.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet var filterButtons: [UIButton]!
    
    let filterTypes: [String] = ["decaffeine", "soybeanMilk", "oatMilk", "lactofree", "decaffeine", "soybeanMilk", "oatMilk", "lactofree"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SetFilterButtons()
    }
    func SetFilterButtons() {
        let buttonWidth = view.frame.width * 0.224
        let spacing = -(view.frame.width - buttonWidth * 4 - 15) / 3
        
        print("view.frame.width \(view.frame.width) buttonWidth \(buttonWidth) spacing \(spacing)")
        
        for index in 0..<filterButtons.count-1 {
            print("index test \(index)")
            filterButtons[index].snp.makeConstraints {
                $0.right.equalTo(filterButtons[index+1].snp.left).offset(spacing)
            }
        }
        for index in filterButtons.indices {
            print("index \(index)")
            filterButtons[index].setImage(UIImage(named: filterTypes[index]+"_w"), for: .normal)
            filterButtons[index].setImage(UIImage(named: filterTypes[index]+"_p"), for: .selected)
            
            filterButtons[index].snp.makeConstraints {
                $0.width.equalTo(buttonWidth)
                $0.height.equalTo(buttonWidth/2)
            }
        }
        print("필터버튼 \(buttonWidth), \(buttonWidth/2)")
    }
//    func setButton() {
//        for i in 0..<filterTypes.count {
//            let filterButton = UIButton()
//            filterButton.setImage(UIImage(named: filterTypes[i]+"_w"), for: .normal)
//            filterButton.setImage(UIImage(named: filterTypes[i]+"_p"), for: .selected)
//            filterButton.contentMode = .scaleAspectFit //  사진의 비율을 맞춤.
//            let xPosition = self.view.frame.width * CGFloat(i) // 현재 보이는 스크린에서 하나의 이미지만 보이게 하기 위해
//
//            filterButton.frame = CGRect(x: xPosition, y: 0, width: self.view.frame.width, height: self.view.frame.height)
//            // 즉 이미지 뷰가 화면 전체를 덮게 됨.
//            scrollView.contentSize.width = self.view.frame.width * CGFloat(1+i)
//            // 이미지의 사이즈를 파악하고 해당 이미지를 올릴 수 있는 만큼 scroll view의 크기를 늘린 후
//            scrollView.addSubview(filterButton)
//            // 이미지를 scroll view에 붙인다.
//        }
//    }

}

