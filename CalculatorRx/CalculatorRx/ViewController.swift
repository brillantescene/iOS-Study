//
//  ViewController.swift
//  CalculatorRx
//
//  Created by ✨EUGENE✨ on 2021/10/12.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dashboardLabel: UILabel!
    var result: Double = 0
    var operand1: Double = 0
    var operand2: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func touchUpNumber(_ sender: UIButton) {
        print("tag \(sender.tag)")
        dashboardLabel.text = "\(sender.tag)"
        result = Double(sender.tag)
    }
    
    // 피연산자 2개 필요
    @IBAction func touchUpOperator(_ sender: UIButton) {
        
        if sender.tag == 0 { // =
            
        }
    }
    
    // 1개 필요
    @IBAction func touchUpUnary(_ sender: UIButton) {
        if sender.tag == 0 { // clear
            result = 0
            dashboardLabel.text = "\(result)"
        } else if sender.tag == 1 { // sign
            result = -result
            dashboardLabel.text = "\(result)"
        } else { // per
            result = result / 100
            dashboardLabel.text = "\(result)"
        }
    }
    
}

