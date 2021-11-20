//
//  TabViewModel.swift
//  CustomTabBarTest
//
//  Created by ✨EUGENE✨ on 2021/08/31.
//

import Foundation

struct TabViewModel {
//    let tabTypes: [String] = ["서울", "강원", "경기", "경상", "전라", "충청", "제주"]
    let tabTypes: [String] = ["트윗", "트윗 및 답글", "미디어", "마음에 들어요"]
    
}

extension TabViewModel {
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfItemsInSection() -> Int {
        return tabTypes.count
    }
}
