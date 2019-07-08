//
//  Concentration.swift
//  Concentration
//
//  Created by Yi Xuan Qi on 2019-07-08.
//  Copyright © 2019 Yi Xuan Qi. All rights reserved.
//

import Foundation

class Concentration {
    
    var cards = [Card]()
    
    // optional varible, it could not be set
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int){
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // check if card match
                if cards[matchIndex].identifier == cards[index].identifier{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                //either no card or 2 cards are faced up
                for flipDownIndex in cards.indices{
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1 ... numberOfPairsOfCards {
            let card = Card()
            cards += [card,card]
        }
        // TODO: Shuffle the cards
        cards = cards.shuffled()
    }
    
    
}


