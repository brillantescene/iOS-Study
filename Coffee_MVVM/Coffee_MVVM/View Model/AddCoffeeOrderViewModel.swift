//
//  AddCoffeeOrderViewModel.swift
//  Coffee_MVVM
//
//  Created by ✨EUGENE✨ on 2021/08/29.
//

import Foundation

struct AddCoffeeOrderViewModel {
    var name: String?
    var email: String?
    
    var coffeeNames: [String] {
        return CoffeeType.allCases.map { $0.rawValue.capitalized }
    }
    
    var size: [String] {
        return CoffeeSize.allCases.map { $0.rawValue.capitalized }
    }
}
