//
//  Task.swift
//  ToDoListRx
//
//  Created by ✨EUGENE✨ on 2021/10/18.
//

import Foundation

enum Priority: Int {
    case high
    case medium
    case low
}
struct Task {
    let title: String
    let proprity: Priority
}
