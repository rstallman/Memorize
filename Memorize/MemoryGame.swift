//
//  MemorizeGame.swift
//  Memorize
//
//  Created by 李金良 on 2023/2/1.
//

import Foundation

struct MemoryGame<CardContent>  where CardContent: Equatable{
    private(set) var cards: Array<Card>
    
    private var indexOfTheOneAndOnlyFaceupCard: Int? {
        get { cards.indices.filter({cards[$0].isFaceup}).oneAndOnly }
        set { cards.indices.forEach {cards[$0].isFaceup = ($0 == newValue)}}
        
    }
    
    mutating func choose(_ card: Card) {
        
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id}),
           !cards[chosenIndex].isFaceup,
           !cards[chosenIndex].isMatched
        {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceupCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                cards[chosenIndex].isFaceup = true
            } else {
                indexOfTheOneAndOnlyFaceupCard = chosenIndex
            }
        }
        
        print("card choosen: \(cards)")
    }
    
    struct Card: Identifiable{
        var isFaceup  = false
        var isMatched = false
        let content: CardContent
        let id: Int
    }
    
    init(numberOfPairsOfCards:Int, cardContentFactory:(Int)->CardContent) {
        cards = []
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2 + 1))
        }
    }
    
    
}

extension Array {
    var oneAndOnly:Element? {
        if count == 1 {
            return first
        } else {
            return nil
        }
    }
}
