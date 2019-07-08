//
//  Card.swift
//  Concentration
//
//  Created by Yi Xuan Qi on 2019-07-08.
//  Copyright © 2019 Yi Xuan Qi. All rights reserved.
//

import Foundation

struct Card {
    
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0;
    
    static func getUniqueIdentifier() -> Int{
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
    
}
