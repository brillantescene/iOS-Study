//
//  ViewController.swift
//  Concentration
//
//  Created by ✨EUGENE✨ on 2021/03/27.
//

import UIKit

class ViewController: UIViewController {

    /* lazy
     스위프트에서 모든 것은 사용하기 전에 완전히 초기화해야 함.
     변수를 lazy로 만들면 누가 사용하기 전까지는 초기화되지 않음.
     제약사항: didSet은 못 씀. 
    */
    private lazy var game = Concentration(numberOfPairsCards: numberOfPairsCards)
    
    var numberOfPairsCards: Int { //computed property
        // 읽기 전용으로 만들 땐 굳이 get이라는 단어를 쓰지 않아도 됨.
        return (cardButtons.count + 1) / 2
    }
    private(set) var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    @IBOutlet private weak var flipCountLabel: UILabel!
    @IBOutlet private var cardButtons: [UIButton]!

    private var emoijChoices = ["🎃","👻","⚡️","✨","🍎","👀","🎨","🎉","📓"]
    private var emoji = [Card:String]()
    
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("Chosen card was not in cardButtons.")
        }
    }
    private func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0) : #colorLiteral(red: 0.8433648944, green: 0.4765799046, blue: 0.1860128343, alpha: 1)
            }
        }
    }
    private func emoji(for card: Card) -> String {
        if emoji[card] == nil, emoijChoices.count > 0 {
            emoji[card] = emoijChoices.remove(at: emoijChoices.count.arc4random)
        }
        return emoji[card] ?? "?"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}
