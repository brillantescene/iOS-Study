//
//  ViewController.swift
//  RadioButton
//
//  Created by ✨EUGENE✨ on 2021/04/01.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var radioButtons: [UIButton]!
    var indexOfOneAndOnlySelectedBtn: Int?
    var check = 0
    
    var whiteImages = ["decaffeine_w", "soybeanMilk_w", "oatMilk_w", "lactoseFreeMilk_w"]
    var purpleImages = ["decaffeine_p", "soybeanMilk_p", "oatMilk_p", "lactoseFreeMilk_p"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for index in radioButtons.indices {
            radioButtons[index].setImage(UIImage(named: whiteImages[index]), for: .normal)
            radioButtons[index].setImage(UIImage(named: purpleImages[index]), for: .selected)
        }
    }

    @IBAction func touchButton(_ sender: UIButton) {
        if indexOfOneAndOnlySelectedBtn != nil{
            if !sender.isSelected {
                for unselectIndex in radioButtons.indices {
                    radioButtons[unselectIndex].isSelected = false
                }
                sender.isSelected = true
                indexOfOneAndOnlySelectedBtn = radioButtons.firstIndex(of: sender)
                check = sender.tag
            } else {
                sender.isSelected = false
                indexOfOneAndOnlySelectedBtn = nil
                check = 0
            }
            
        } else {
            sender.isSelected = true
            indexOfOneAndOnlySelectedBtn = radioButtons.firstIndex(of: sender)
            check = sender.tag
        }
        print(sender.isSelected, indexOfOneAndOnlySelectedBtn ?? 0)
        print("check: \(check)")
    }
}

