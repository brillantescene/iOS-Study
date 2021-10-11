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
    var menuObservable = BehaviorSubject<[Menu]>(value: [])
    
    lazy var itemsCount = menuObservable.map {
        $0.map{ $0.count }.reduce(0, +)
    }
    lazy var totalPrice = menuObservable.map {
        $0.map{ $0.price * $0.count }.reduce(0, +)
    }
    
    //    Subject: 값을 받아먹기도, 써먹기도 할 수 있음
    
    init() {
        _ = APIService.fetchAllMenusRx()
            .map { data -> [MenuItem] in
                struct Response: Decodable {
                    let menus: [MenuItem]
                }
                let response = try! JSONDecoder().decode(Response.self, from: data)
                return response.menus
            }
            .map { menuItems in
                var menus:[Menu] = []
                menuItems.enumerated().forEach{(index, item) in
                    let menu = Menu.fromMenuItems(id: index, item: item)
                    menus.append(menu)
                }
                return menus
            }
            .take(1)
            .bind(to: menuObservable)
    }
    
    func clearAllItemSelections() {
        _ = menuObservable
            .map { menus in
                return menus.map {
                    Menu(id: $0.id, name: $0.name, price: $0.price, count: 0)
                }
            }
            .take(1) // 한번만 수행하겠다는 뜻. disposable 처리안해도 됨
            .subscribe(onNext: {
                self.menuObservable.onNext($0)
            })
    }
    
    func changeCount(item: Menu, increase: Int) {
        _ = menuObservable
            .map { menus in
                menus.map {
                    if $0.id == item.id {
                        return Menu(id: $0.id, name: $0.name, price: $0.price, count: max($0.count + increase, 0))
                    } else {
                        return Menu(id: $0.id, name: $0.name, price: $0.price, count: $0.count)
                    }
                }
            }
            .take(1) // 한번만 수행하겠다는 뜻. disposable 처리안해도 됨
            .subscribe(onNext: {
                self.menuObservable.onNext($0)
            })
    }
    
    func onOrder() {
        
    }
}
