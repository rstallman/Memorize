//
//  MemorizeGame.swift
//  Memorize
//
//  Created by 李金良 on 2023/2/1.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    func choose(card: Card) {
        print("card choosen: \(card)")
    }
    
    struct Card: Identifiable{
        var id: Int
        
        var isFaceup: Bool = true
        var isMatched: Bool = false
        var content: CardContent
    }
    
    init(numberOfPairsOfCards:Int, cardContentFactory:(Int)->CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id: pairIndex*2,  content: content))
            cards.append(Card(id: pairIndex*2 + 1, content: content))
        }
    }
    
    
}





func multiply(operand:Int, by:Int) -> Int {
    var a = Array<Int>()
    a.append(10)
    var operation: (Double) -> Double
    operation = Square
    _ = operation(4)
    
    
    return operand * by
}

func Square(operand:Double) -> Double {
    return operand * operand
}
