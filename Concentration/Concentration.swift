//
//  Concentration.swift
//  Concentration
//
//  Created by Yi Xuan Qi on 2019-07-08.
//  Copyright © 2019 Yi Xuan Qi. All rights reserved.
//

import Foundation

class Concentration {
    
    private(set) var cards = [Card]()
    
    // optional varible, it could not be set
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get{
            var foundIndex: Int?
            for index in cards.indices{
                if cards[index].isFaceUp{
                    if foundIndex == nil{
                        foundIndex = index
                    }else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set{
            for index in cards.indices{
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    func chooseCard(at index: Int){
        assert(cards.indices.contains(index),"Concentration.chooseCard(at: \(index)): choosen index does not exist")
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // check if card match
                if cards[matchIndex].identifier == cards[index].identifier{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                //either no card or 2 cards are faced up
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards>0,"Concentration.init (\(numberOfPairsOfCards)): must have at least one pair of cards")
        for _ in 1 ... numberOfPairsOfCards {
            let card = Card()
            cards += [card,card]
        }
        // Shuffle the cards
        cards = cards.shuffled()
    }
}



