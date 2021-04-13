//
//  Concentration.swift
//  Concentration
//
//  Created by ✨EUGENE✨ on 2021/03/31.
//

import Foundation

struct Concentration {
    private(set) var cards = [Card]()
    
    private var indexOfOneAndOnlyFaceUpCard: Int? { //computed property
        get {
            // 인덱스 살펴보고 카드가 앞면인지 검사. 앞면이면 true
            // faceUpCardIndices는 배열의 인덱스를 담고 있는 배열임
            return cards.indices.filter { cards[$0].isFaceUp }.oneAndOnly
            
//            var foundIndex: Int? // 앞면인 카드를 모두 찾고, 찾았다면 그 카드를 넣어줌
//            for index in cards.indices {
//                if cards[index].isFaceUp { // 앞면을 찾으면
//                    if foundIndex == nil {
//                        foundIndex = index
//                    } else {
//                        return nil
//                    }
//                }
//            }
//            return foundIndex
        }
        set { // 모든 카드를 살펴본 후 여기 해당하는 카드 빼고 모두 뒷면으로 놓기
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
                // index와 iOOAOFC의 newValue와 같다면 isFaceUp을 true로 설정
                // newValue가 어떤 수라면 참값이 되는거임
            }
        }
    }
    
    mutating func chooseCard(at index: Int) {
        // assert - API를 부적절한 사용으로부터 보호
        assert(cards.indices.contains(index), "Concentraion.chooseCard(at: \(index)): chosen index not in the cards.")
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // check if cards match
                if cards[matchIndex] == cards[index] {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                // 매칭이 되었든 안되었든 단 한 장의 카드만 앞면인 경우가 아니니까 nil
//                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                // either no cards or 2 cards are face up
                // 모든 카드를 뒷면으로 뒤집자
//                for filpDownIndex in cards.indices {
//                    cards[filpDownIndex].isFaceUp = false
//                }
//                // 카드를 하나 선택했으니 그 카드만 앞면으로
//                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsCards: Int) {
        assert(numberOfPairsCards > 0, "Concentraion.init(\(numberOfPairsCards)): you must have at least one pair of cards.")
        for _ in 1...numberOfPairsCards {
            let card = Card()
            cards += [card, card]
        }
        // TODO: Shuffle the cards
    }
}

extension Collection {
    // Element: 그 안에 있는 것의 타입이 됨. Element는 배열에서 플레이스 홀더 같은 개념.
    // 유일한 한 가지 요소가 있을 때 return first. 요소가 여러개면 return nil
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
}
