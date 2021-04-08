//
//  Card.swift
//  Concentration
//
//  Created by ✨EUGENE✨ on 2021/03/31.
//

import Foundation

struct Card: Hashable {
    
    var hashValue: Int { return identifier }
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    // 얘네는 각 개개의 카드들과 저장되지만
    var isFaceUp = false
    var isMatched = false
    private var identifier: Int
    
    // 이건 타입과 저장됨
    private static var identifierFactory = 0
    
    private static func getUniqueIdentifier() -> Int {
        // 정적 메소드 안이어서 Card. 없이도 정적 변수에 접근 가능
        identifierFactory += 1
        return identifierFactory
    }
    /*
     static func 정적 함수
     함수이고 Card안에 있지만 Card에게 보낼 수 없음.
     Card는 이 메세지를 이해하지 못 함.
     이 메세지를 이해하는 건 Card 타입 뿐.
     이건 타입 자체에 보낼 수 있음.
     걍 타입에 붙어있는 함수라고 보면 됨.
    */
    
    // init은 내부 이름과 외부 이름이 종종 같은 유일한 메소드
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
