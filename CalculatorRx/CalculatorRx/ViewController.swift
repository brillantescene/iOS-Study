//
//  ViewController.swift
//  CalculatorRx
//
//  Created by ✨EUGENE✨ on 2021/10/12.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dashboardLabel: UILabel!
    
    let viewModel = CalculateViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func touchUpNumber(_ sender: UIButton) {
        dashboardLabel.text = "\(sender.tag)"
        viewModel.getNumber(sender.tag)
    }
    
    // 피연산자 2개 필요
    @IBAction func touchUpOperator(_ sender: UIButton) {
        viewModel.getOperator(sender.tag)
        // = 이면 label 표시
        if sender.tag == 0 {
            dashboardLabel.text = "\(viewModel.result)"
        }
    }
    
    // 1개 필요
    @IBAction func touchUpUnary(_ sender: UIButton) {
        dashboardLabel.text = viewModel.calculate(with: sender.tag)
    }
}
