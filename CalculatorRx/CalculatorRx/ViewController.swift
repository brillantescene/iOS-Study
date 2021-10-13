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
    
    var operandArr: [Double] = []
    var operatorArr: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func touchUpNumber(_ sender: UIButton) {
        print("tag \(sender.tag)")
        dashboardLabel.text = "\(sender.tag)"
        result = Double(sender.tag)
        operandArr.append(result)
    }
    
    // 피연산자 2개 필요
    @IBAction func touchUpOperator(_ sender: UIButton) {
        
        if sender.tag == 0 { // =
            while !operatorArr.isEmpty {
                operation(op: operatorArr.popLast()!)
            }
            result = operandArr.first!
            dashboardLabel.text = "\(result)"
        } else if sender.tag == 1 { // +
            while !operatorArr.isEmpty {
                operation(op: operatorArr.popLast()!)
            }
            operatorArr.append("+")
        } else if sender.tag == 2 { // -
            while !operatorArr.isEmpty {
                operation(op: operatorArr.popLast()!)
            }
            operatorArr.append("-")
        } else if sender.tag == 3 { // *
            while !operatorArr.isEmpty && (operatorArr.last == "*" || operatorArr.last == "/") {
                operation(op: operatorArr.popLast()!)
            }
            operatorArr.append("*")
        } else if sender.tag == 4 { // /
            while !operatorArr.isEmpty && (operatorArr.last == "*" || operatorArr.last == "/") {
                operation(op: operatorArr.popLast()!)
            }
            operatorArr.append("/")
        }
        
        print(operandArr, operatorArr)
    }
    func operation(op: String) {
        
        let b = operandArr.popLast()!
        let a = operandArr.popLast()!
        
        if op == "+" {
            operandArr.append(a + b)
        } else if op == "-" {
            operandArr.append(a - b)
        } else if op == "*" {
            operandArr.append(a * b)
        } else if op == "/" {
            operandArr.append(a / b)
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
