//
//  ViewController.swift
//  CalculatorRx
//
//  Created by ✨EUGENE✨ on 2021/10/12.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var dashboardLabel: UILabel!
    
    let viewModel = CalculateViewModel()
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.result
            .subscribe(onNext: {
                self.dashboardLabel.text = "\($0)"
            })
            .disposed(by: disposeBag)
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
            dashboardLabel.text = viewModel.getResult()
        }
    }
    
    // 1개 필요
    @IBAction func touchUpUnary(_ sender: UIButton) {
        
        dashboardLabel.text = viewModel.calculate(with: sender.tag)
    }
}
