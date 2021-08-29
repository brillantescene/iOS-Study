//
//  OrderViewModel.swift
//  Coffee_MVVM
//
//  Created by ✨EUGENE✨ on 2021/08/29.
//

import Foundation

class OrderListViewModel {
    var ordersViewModel: [OrderViewModel]
    
    init() {
        self.ordersViewModel = [OrderViewModel]()
    }
}

extension OrderListViewModel {
    func orderViewModel(at index: Int) -> OrderViewModel {
        return self.ordersViewModel[index]
    }
}
struct OrderViewModel {
    let order: Order
}

extension OrderViewModel {
    
    var name: String {
        return self.order.name
    }
    
    var coffeeName: String {
        return self.order.coffeeName.rawValue.capitalized
    }
    
    var total: Double {
        // caplitalized: latte -> Latte
        return self.order.total
    }
    
    var size: String {
        return self.order.size.rawValue.capitalized
    }
}
