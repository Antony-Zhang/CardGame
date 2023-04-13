//
//  Game.swift
//  CardGame
//
//  Created by EastOS on 2023/4/13.
//

import Foundation

struct Card{
    var isFaceup = false    //  是否翻起
    var isSet = false   //
    var isMatched = false
    var isHalfMatched = false
    var groupID: Int
}

class Game{
    var cards = [Card]()
    
    var halfmatchGroupID: Int?
    var sumOfMatchedCard = 0
    var sumOfMatchedGroup = 0
    
    init(numberOfGoupsOfCards: Int){
        for _ in 1...numberOfGoupsOfCards{
            let card = Card()
            cards += [card,card,card,card]
        }
    }
    func chooseCard(at index: Int){
        if !cards[index].isHalfMatched,!cards[index].isMatched{
            
        }
    }
}
