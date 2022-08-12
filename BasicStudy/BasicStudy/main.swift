//
//  main.swift
//  BasicStudy
//
//  Created by ✨EUGENE✨ on 2022/07/31.
//

import Foundation

enum BasicEnum {
    case one, two
}
enum TestOptional<T> {
    case none
    case some(T)
    
    init(_ some: T) {
        self = .some(some)
    }
    
    
//    init?(rawValue: String) {
//       switch rawValue.lowercased() {
//       case "jpg", "jpeg": self = .jpg
//       case "bmp", "bitmap": self = .bmp
//       case "gif", "gifv": self = .gif
//       default: return nil
//     }
}
var name = "eugene"
var optionalName: Optional<String> = "eugene"
var basicEnum: BasicEnum = .one
var test: TestOptional<String> =


print("Hi I'm \(name)")
print("Hi I'm \(optionalName)")

print("enum \(basicEnum)")
print("test enum \(test)")
