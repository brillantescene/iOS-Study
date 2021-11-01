//
//  ViewController.swift
//  MultipleFilterTest
//
//  Created by ✨EUGENE✨ on 2021/11/01.
//

import UIKit
import Then
import SnapKit

class ViewController: UIViewController {

    let filterScrollView = UIScrollView().then {
        $0.showsHorizontalScrollIndicator = false
    }
    let filterScrollInnerView = UIView()
    var filterButtons = [UIButton]()
    
    let viewModel = HomeViewModel()
    
    var buttonWidth: CGFloat = 0 // 버튼 크기
    var safeArea = UILayoutGuide()
    var cafeState = 0 // 어떤 옵션이 선택되어 있는지
    var indexOfOneAndOnlyFilterButton: Int? // 라디오 버튼
    
    
    var data = [Result]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        safeArea = view.safeAreaLayoutGuide
        buttonWidth = view.frame.width * 0.224
        
        addView()
        setAutoLayout()
        
        let num = 2
        let arr = [1, 2, 3]
        if arr.contains(num) {
            print("hi")
        }
    }


    private func addView() {
        
        view.addSubview(filterScrollView)
        // scrollInnerView
        filterScrollView.addSubview(filterScrollInnerView)
        // 카테고리 버튼
        for i in 1...6 {
            let button = UIButton()
            button.tag = i
            button.titleLabel?.text = Category.asArray[i-1].rawValue
            filterScrollInnerView.addSubview(button)
            filterButtons.append(button)
        }
    }
    
    private func setAutoLayout() {
        
        filterScrollView.snp.makeConstraints {
            $0.left.right.equalTo(safeArea)
            $0.top.equalTo(safeArea).offset(200)
            $0.height.equalTo(buttonWidth/2 + 12)// + 24)
        }
        filterScrollInnerView.snp.makeConstraints {
            $0.left.right.top.bottom.equalTo(filterScrollView.contentLayoutGuide)
            $0.height.equalTo(filterScrollView.frameLayoutGuide)
            $0.width.equalTo(self.view.frame.width * 1.43)
        }
        
        filterScrollView.clipsToBounds = true
        filterScrollInnerView.clipsToBounds = true
        
        // 카테고리 버튼
        filterButtons[0].snp.makeConstraints {
            $0.left.equalTo(filterScrollInnerView).offset(9)
        }
        setFilterButtons()
    }
    
    private func setFilterButtons() {
        let spacing = -(view.frame.width - buttonWidth * 4 - 31) / 3

        for index in 0..<filterButtons.count-1 {
            print("index test \(index)")
            filterButtons[index].snp.makeConstraints {
                $0.right.equalTo(filterButtons[index+1].snp.left).offset(spacing)
            }
        }
        
        for index in filterButtons.indices {
            
            filterButtons[index].setImage(UIImage(named: "\(Category.asArray[index])"+"_w"), for: .normal)
            filterButtons[index].setImage(UIImage(named: "\(Category.asArray[index])"+"_p"), for: .selected)
            
            filterButtons[index].addTarget(self, action: #selector(sendFilterButtonTag(_:)), for: .touchUpInside)
            
            print("index \(index), \(filterButtons[index])")
            
            filterButtons[index].snp.makeConstraints {
                $0.top.equalTo(filterScrollInnerView).offset(10)
                $0.width.equalTo(buttonWidth)
                $0.height.equalTo(buttonWidth/2)
            }
        }
        print("필터버튼 \(buttonWidth), \(buttonWidth/2)")
    }
    
    @objc func sendFilterButtonTag(_ sender:UIButton) {
        print("카테고리 \(sender.tag) \(Category.asArray[sender.tag-1])")
        if sender.isSelected {
            sender.isSelected = false
        } else {
            sender.isSelected = true
        }
    }
//    @objc func sendFilterButtonTag(_ sender:UIButton) {
//        print("카테고리 \(sender.tag) \(Category.asArray[sender.tag-1])")
//        if indexOfOneAndOnlyFilterButton != nil{
//            if !sender.isSelected {
//                for unselectIndex in filterButtons.indices {
//                    filterButtons[unselectIndex].isSelected = false
//                }
//                sender.isSelected = true
//                indexOfOneAndOnlyFilterButton = filterButtons.firstIndex(of: sender)
//                cafeState = sender.tag
//            } else {
//                sender.isSelected = false
//                indexOfOneAndOnlyFilterButton = nil
//                cafeState = 0
//            }
//
//        } else {
//            sender.isSelected = true
//            indexOfOneAndOnlyFilterButton = filterButtons.firstIndex(of: sender)
//            cafeState = sender.tag
//        }
//        print(sender.isSelected, indexOfOneAndOnlyFilterButton ?? 0)
//        print("check: \(cafeState)")
//    }
}

