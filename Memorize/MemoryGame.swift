//
//  MemorizeGame.swift
//  Memorize
//
//  Created by 李金良 on 2023/2/1.
//

import Foundation

struct MemoryGame<CardContent>  where CardContent: Equatable{
    private(set) var cards: Array<Card>
    
    
    private var indexOfTheOneAndOnlyFaceupCard: Int?
    
    
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
                indexOfTheOneAndOnlyFaceupCard = nil
            } else {
                for index in cards.indices {
                    cards[index].isFaceup = false
                }
                indexOfTheOneAndOnlyFaceupCard = chosenIndex
            }
            
            cards[chosenIndex].isFaceup.toggle()
        }
        print("card choosen: \(cards)")
    }
    
    struct Card: Identifiable{
        var id: Int
        
        var isFaceup: Bool = false
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
