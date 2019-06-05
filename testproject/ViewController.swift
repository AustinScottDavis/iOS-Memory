//
//  ViewController.swift
//  testproject
//
//  Created by Austin Davis on 5/21/19.
//  Copyright © 2019 Austin Davis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
    private lazy var game = Memory(numberOfPairsOfCards: numberOfPairsOfCards)
    
    var numberOfPairsOfCards: Int {
        return (cardButtons.count + 1) / 2
    }
    
    private(set) var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }

    @IBOutlet private weak var flipCountLabel: UILabel!

    @IBOutlet private var cardButtons: [UIButton]!

    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.9858418107, green: 0.60793221, blue: 0, alpha: 0) : #colorLiteral(red: 0.9858418107, green: 0.60793221, blue: 0, alpha: 1)
            }
        }
    }
    
    private var emojiChoices = ["🐣", "🦉"]
    
    private var emoji = Dictionary<Int,String>()
    
    private func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
}

