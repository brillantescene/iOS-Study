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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func touchButton(_ sender: UIButton) {
        if let index = indexOfOneAndOnlySelectedBtn{
            if !sender.isSelected {
                for unselectIndex in radioButtons.indices {
                    radioButtons[unselectIndex].isSelected = false
                }
                sender.isSelected = true
                indexOfOneAndOnlySelectedBtn = radioButtons.firstIndex(of: sender)
            } else {
                sender.isSelected = false
                indexOfOneAndOnlySelectedBtn = nil
            }
            
        } else {
            sender.isSelected = true
            indexOfOneAndOnlySelectedBtn = radioButtons.firstIndex(of: sender)
        }
        print(sender.isSelected, indexOfOneAndOnlySelectedBtn ?? "nil")
    }
}

