//
//  Card.swift
//  Concentration
//
//  Created by Yi Xuan Qi on 2019-07-08.
//  Copyright © 2019 Yi Xuan Qi. All rights reserved.
//

import Foundation


struct Card: Hashable
{
    var isFaceUp = false
    var isMatched = false
    private var identifier: Int
    
    func hash(into hasher: inout Hasher){
        hasher.combine(identifier)
    }
    
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    private static var identifierFactory = 0;
    
    private static func getUniqueIdentifier() -> Int{
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
    
}
