//
//  Concentration.swift
//  Concentration
//
//  Created by Yi Xuan Qi on 2019-07-08.
//  Copyright © 2019 Yi Xuan Qi. All rights reserved.
//

import Foundation

struct Concentration {
    
    private(set) var cards = [Card]()
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get{
            return cards.indices.filter{cards[$0].isFaceUp}.oneAndOnly
        }
        set{
            for index in cards.indices{
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    mutating func chooseCard(at index: Int){
        assert(cards.indices.contains(index),"Concentration.chooseCard(at: \(index)): choosen index does not exist")
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // check if card match
                if cards[matchIndex] == cards[index]{
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

extension Collection {
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
}


