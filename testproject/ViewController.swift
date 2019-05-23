//
//  ViewController.swift
//  testproject
//
//  Created by Austin Davis on 5/21/19.
//  Copyright © 2019 Austin Davis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var flipCount = 0 {
    didSet {
      flipCountLabel.text = "Flips: \(flipCount)"
    }
  }

  @IBOutlet weak var flipCountLabel: UILabel!
  
  @IBOutlet var cardButtons: [UIButton]!
  
  var emojiChoices = ["🐣", "🦉", "🐣", "🦉"]
  
  @IBAction func touchCard(_ sender: UIButton) {
    flipCount += 1
    if let cardNumber = cardButtons.firstIndex(of: sender) {
      flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
    }
  }
  
  func flipCard(withEmoji emoji: String, on button: UIButton) {
    if button.currentTitle == emoji {
      button.setTitle("", for: UIControl.State.normal)
      button.backgroundColor = #colorLiteral(red: 0.9858418107, green: 0.60793221, blue: 0, alpha: 1)
    } else {
      button.setTitle(emoji, for: UIControl.State.normal)
      button.backgroundColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
    }
  }
}

