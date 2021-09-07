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
    @IBOutlet weak var filterButtonView: UIView!
    @IBOutlet var filterButtons: [UIButton]!
    
    var cafeState = 0 // 어떤 옵션이 선택되어 있는지
    var indexOfOneAndOnlyFilterButton: Int?
    var buttonWidth: CGFloat = 0
    
    let filterTypes: [String] = ["decaffeine", "soybeanMilk", "oatMilk", "lactofree", "decaffeine", "soybeanMilk", "oatMilk", "lactofree"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonWidth = view.frame.width * 0.224
        scrollView.snp.makeConstraints {
            $0.height.equalTo(buttonWidth/2 + 24)
        }
        filterButtonView.snp.makeConstraints {
            $0.width.equalTo(self.view.frame.width * 2)
        }
        print("filterButtonView.frame.width \(filterButtonView.frame.width)")
        SetFilterButtons()
    }
    func SetFilterButtons() {
//        let buttonWidth = view.frame.width * 0.224
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
    @IBAction func filterButtonDidTap(_ sender: UIButton) {
        if indexOfOneAndOnlyFilterButton != nil{
            if !sender.isSelected {
                for unselectIndex in filterButtons.indices {
                    filterButtons[unselectIndex].isSelected = false
                }
                sender.isSelected = true
                indexOfOneAndOnlyFilterButton = filterButtons.firstIndex(of: sender)
                cafeState = sender.tag
            } else {
                sender.isSelected = false
                indexOfOneAndOnlyFilterButton = nil
                cafeState = 0
            }
            
        } else {
            sender.isSelected = true
            indexOfOneAndOnlyFilterButton = filterButtons.firstIndex(of: sender)
            cafeState = sender.tag
        }
        print(sender.isSelected, indexOfOneAndOnlyFilterButton ?? 0)
        print("check: \(cafeState)")
//        serviceFunc()
    }
}

