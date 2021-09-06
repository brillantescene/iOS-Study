//
//  BasicInformation.swift
//  SwiftStudy
//
//  Created by ✨EUGENE✨ on 2021/05/28.
//

import Foundation

struct BasicInformation {
    var name: String
    var age: Int
    
    mutating func changeAge() {
        age += 1
    }
}
