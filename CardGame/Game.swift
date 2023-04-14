//
//  Game.swift
//  CardGame
//
//  Created by EastOS on 2023/4/11.
//

import Foundation
class Game{
    var cards = [Card]()    // several groups of card in game
    
    //  to rec the status of the game
    var halfMatchedGroupID: Int?    // 不完全展开-halfMatched
    var sumOfMatchedCard = 0        // 某组中已翻开的匹配的牌的个数，为4时该组完成
    var sumOfMarchedGroup = 0       // 已完成的牌组数，为3时游戏结束
    
    init(numberOfGroupOfCards: Int) {
        for _ in 1...numberOfGroupOfCards{
            // _指代变量； 1...3表示[1，3]，1..<3 表示[1,3)
            let card = Card()
            cards += [card,card,card,card]  // 将card对象复制四份作为一组，保证一组内的GroupID是一样的
        }
    }
    
    // what happens after one card is flipped
//    func chooseCard(at index: Int, reg mapsReg: inout [(randomID: Int, cardID: Int)]){         // 翻牌
//        //  inout关键字表示引用传递
//        cards[index].isFaceup = true
        
        
//        if !cards[index].isHalfMatched,!cards[index].isMatched{
//            // 未匹配成功时
//            sumOfMatchedCard += 1
//
//        }
//    }
}

struct Card{
//    var isFaceup = false    // 是否翻起
//    var isMatched = false   // 是否匹配
//    var isHalfMatched = false   // 是否半匹配
    var groupID: Int
    
    static var groupIDFactory = -1
    
    static func getUniqueGroupID() -> Int{
        groupIDFactory += 1
        return groupIDFactory
    }
    
    init(){
        groupID = Card.getUniqueGroupID()
    }
}
