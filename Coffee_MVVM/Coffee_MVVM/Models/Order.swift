//
//  Order.swift
//  Coffee_MVVM
//
//  Created by ✨EUGENE✨ on 2021/08/29.
//

import Foundation

enum CoffeeType: String, Codable, CaseIterable {
    case capuccino
    case latte
    case espressino
    case cortado
}

enum CoffeeSize: String, Codable, CaseIterable {
    case small
    case medium
    case large
}
struct Order: Codable {
    let name: String
    let coffeeName: CoffeeType
    let total: Double
    let size: CoffeeSize
}
