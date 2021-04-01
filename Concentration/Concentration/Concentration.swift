//
//  Concentration.swift
//  Concentration
//
//  Created by ✨EUGENE✨ on 2021/03/31.
//

import Foundation

class Concentration {
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                // 매칭이 되었든 안되었든 단 한 장의 카드만 앞면인 경우가 아니니까 nil
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                // either no cards or 2 cards are face up
                // 모든 카드를 뒷면으로 뒤집자
                for filpDownIndex in cards.indices {
                    cards[filpDownIndex].isFaceUp = false
                }
                // 카드를 하나 선택했으니 그 카드만 앞면으로
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsCards: Int) {
        for _ in 1...numberOfPairsCards {
            let card = Card()
            cards += [card, card]
        }
        // TODO: Shuffle the cards
    }
}
