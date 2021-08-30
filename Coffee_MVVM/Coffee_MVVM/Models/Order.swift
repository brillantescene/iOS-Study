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

extension Order {
    
    static var all: Resource<[Order]> = {
        guard let url = URL(string: "https://island-bramble.glitch.me/orders") else {
            fatalError("URL is incorrect!")
        }
        
        return Resource<[Order]>(url: url)
    }()
    
    static func create(vm: AddCoffeeOrderViewModel) -> Resource<Order?> {
        let order = Order(vm)
        
        guard let url = URL(string: "https://island-bramble.glitch.me/orders") else {
            fatalError("URL is incorrect!")
        }
        guard let data = try? JSONEncoder().encode(order) else {
            fatalError("Error encoding order!")
        }
        
        var resource = Resource<Order?>(url: url)
        resource.httpMethod = HttpMethod.post
        resource.body = data
        return resource
    }
}

extension Order {
    
    init?(_ vm: AddCoffeeOrderViewModel) {
        guard let name = vm.name,
              let selectedCoffee = CoffeeType(rawValue: vm.selectedCoffee!.lowercased()),
              let total = vm.total,
              let selectedSize = CoffeeSize(rawValue: vm.selectedSize!.lowercased())
        else {
            return nil
        }
        self.name = name
        self.coffeeName = selectedCoffee
        self.total = total
        self.size = selectedSize
    }
}
