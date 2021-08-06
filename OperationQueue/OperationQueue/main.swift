//
//  main.swift
//  OperationQueue
//
//  Created by ✨EUGENE✨ on 2021/08/06.
//

import Foundation

let blockOperation = BlockOperation {
    for i in 1...10 {
        print(i)
    }
}

let blockOperation2 = BlockOperation {
    for i in 1...10 {
        print("eugene\(i)")
    }
}

let queue = OperationQueue()

queue.maxConcurrentOperationCount = 2
queue.addOperation(blockOperation)
queue.addOperation(blockOperation2)

sleep(5)
