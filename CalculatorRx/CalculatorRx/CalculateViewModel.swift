//
//  CalculateViewModel.swift
//  CalculatorRx
//
//  Created by ✨EUGENE✨ on 2021/10/13.
//

import Foundation
import RxSwift

class CalculateViewModel {
    
    var operandArr: [Double] = []
    var operatorArr: [String] = []
    
    let operatorBag = ["=", "+", "-", "*", "/"]
    
    var result: BehaviorSubject<Double> = BehaviorSubject(value: 0)
    
    func getNumber(_ num: Int) {
        result = Double(num)
        operandArr.append(result)
    }
    
    func getResult() -> String {
        print("\(floor(result))", "\(result)")
        return result.isInt() ? "\(Int(result))" : "\(result)"
    }
    
    func getOperator(_ tag: Int) {
        if tag == 0 { // =
            while !operatorArr.isEmpty {
                operation(op: operatorArr.popLast()!)
            }
            result = operandArr.first!
            operandArr.removeAll()
        } else {
            if tag == 1 || tag == 2 { // +-
                while !operatorArr.isEmpty {
                    operation(op: operatorArr.popLast()!)
                }
            } else if tag == 3 || tag == 4 { // */
                while !operatorArr.isEmpty && (operatorArr.last == "*" || operatorArr.last == "/") {
                    operation(op: operatorArr.popLast()!)
                }
            }
            operatorArr.append(operatorBag[tag])
        }
        
        print(operandArr, operatorArr)
    }
    
    func calculate(with op: Int) -> String {
        if op == 0 { // clear
            result = 0
            operandArr.removeAll()
            operatorArr.removeAll()
        } else if op == 1 { // sign
            result = -result
            operandArr.removeLast()
            operandArr.append(result)
        } else if op == 2 { // per
            result = result / 100
            operandArr.removeLast()
            operandArr.append(result)
        }
        return getResult()
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
}

extension Double {
    func isInt() -> Bool {
        return self == floor(self)
    }
}
