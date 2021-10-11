//
//  MenuListViewModel.swift
//  RxSwift+MVVM
//
//  Created by ✨EUGENE✨ on 2021/10/08.
//  Copyright © 2021 iamchiwon. All rights reserved.
//

import Foundation
import RxSwift

class MenuListViewModel {
    var menuObservable = PublishSubject<[Menu]>()
    
    lazy var itemsCount = menuObservable.map {
        $0.map{ $0.count }.reduce(0, +)
    }
    lazy var totalPrice = menuObservable.map {
        $0.map{ $0.price * $0.count }.reduce(0, +)
    }
    
    //    Subject: 값을 받아먹기도, 써먹기도 할 수 있음
    
    init() {
        let menus: [Menu] = [
            Menu(title: "튀김1", price: 100, count: 0),
            Menu(title: "튀김1", price: 100, count: 0),
            Menu(title: "튀김1", price: 100, count: 0),
            Menu(title: "튀김1", price: 100, count: 0)
        ]
        
        menuObservable.onNext(menus)
    }
}
