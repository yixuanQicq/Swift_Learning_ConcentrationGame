//
//  ViewController.swift
//  Concentration
//
//  Created by Yi Xuan Qi on 2019-07-06.
//  Copyright © 2019 Yi Xuan Qi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var game: Concentration = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    var numberOfPairsOfCards: Int{
        return (cardButtons.count + 1)/2
    }
    
    private(set) var flipCount = 0 {
        didSet{
            updateFlipCountLabel()
        }
    }
    
    private func updateFlipCountLabel(){
        let attributes: [NSAttributedString.Key:Any] = [
            .strokeWidth : -1.0,
            .strokeColor : #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        ]
        let attributedString = NSAttributedString(string: "Flips: \(flipCount)", attributes: attributes)
        flipCountLabel.attributedText = attributedString
    }
    
    @IBAction private func newGameButton(_ sender: Any) {
        game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
        updateViewFromMode()
        flipCount = 0
        //emojiChoices = ["💕","🥰","💙💛","🌸","💎","🌈","🍀","🐣","❄️"]
        emojiChoices = "💕🥰💛🌸💎🌈🍀🐣❄️"
    }
    
    @IBOutlet private var cardButtons: [UIButton]!
    
    @IBOutlet private weak var flipCountLabel: UILabel!{
        didSet{
            updateFlipCountLabel()
        }
    }
    
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromMode()
        } else{
            print("choosen card is not in cardButtons")
        }
    }
    
    private func updateViewFromMode(){
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji (for: card), for: UIControl.State.normal)
                button.layer.cornerRadius = 15
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }else {
                button.setTitle("", for: UIControl.State.normal)
                button.layer.cornerRadius = 15
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.4039751887, green: 0.633209765, blue: 0.90732342, alpha: 0) : #colorLiteral(red: 0.4039751887, green: 0.633209765, blue: 0.90732342, alpha: 1)
            }
        }
    }
    
    //private var emojiChoices = ["💕","🥰","💛","🌸","💎","🌈","🍀","🐣","❄️"]
    private var emojiChoices = "💕🥰💛🌸💎🌈🍀🐣❄️"
    
    private var emoji = [Card:String]()
    
    private func emoji(for card: Card) -> String{
        if emoji[card] == nil, emojiChoices.count > 0{
            let randomStringIndex = emojiChoices.index(emojiChoices.startIndex, offsetBy: emojiChoices.count.arc4random)
            emoji[card] = String(emojiChoices.remove(at: randomStringIndex))
        }
        // if nil return ?, if not return its value
        return emoji[card] ?? "?"
    }
}

extension Int{
    var arc4random:Int {
        if self > 0{
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0{
            return -1*Int(arc4random_uniform(UInt32(abs(self))))
        } else{
            return 0
        }
    }
}


