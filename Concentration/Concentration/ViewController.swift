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
    lazy var game = Concentration(numberOfPairsCards: (cardButtons.count + 1) / 2)
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!

    var emoijChoices = ["🎃","👻","⚡️","✨","🍎","👀","🎨","🎉","📓"]
    var emoji = [Int:String]()
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("Chosen card was not in cardButtons.")
        }
    }
    func updateViewFromModel() {
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
    func emoji(for card: Card) -> String {
        
        if emoji[card.identifier] == nil, emoijChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emoijChoices.count)))
            emoji[card.identifier] = emoijChoices.remove(at: randomIndex)
        }
        /*
         if emoji[card.identifier] != nil {
             return emoji[card.identifier]!
         } else {
             return "?"
         }
         완전 똑같은 의미!
         return emoji[card.identifier] ?? "?"
        */
        return emoji[card.identifier] ?? "?"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
