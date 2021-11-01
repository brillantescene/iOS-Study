//
//  HomeViewModel.swift
//  MultipleFilterTest
//
//  Created by ✨EUGENE✨ on 2021/11/01.
//

import Foundation

class HomeViewModel {
    
}

struct Result {
    let title: String
    let category: [Category]
}

enum Category: String, CaseIterable {
    case decaffeine = "디카페인"
    case soybeanMilk = "두유"
    case oatMilk = "귀리우유"
    case lactofree = "락토프리"
    case almond = "아몬드우유"
    case coconut = "코코넛우유"
    
    static var asArray: [Category] {
        return self.allCases
    }
    
    private var sortOrder: Int {
        switch self {
            case .decaffeine:
                return 1
            case .soybeanMilk:
                return 2
            case .oatMilk:
                return 3
            case .lactofree:
                return 4
            case .almond:
                return 5
            case .coconut:
                return 6
        }
    }

     static func ==(lhs: Category, rhs: Category) -> Bool {
        return lhs.sortOrder == rhs.sortOrder
    }

    static func <(lhs: Category, rhs: Category) -> Bool {
       return lhs.sortOrder < rhs.sortOrder
    }
}
