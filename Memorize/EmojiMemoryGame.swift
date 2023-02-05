//
//  EmojiMeoryGame.swift
//  Memorize
//
//  Created by 李金良 on 2023/2/1.
//

import SwiftUI


class EmojiMemoryGame:ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    @Published private var model =  EmojiMemoryGame.createMemoryGame()
    
    private static  let emojis = ["👻", "😀", "🎃", "A", "B", "C", "D", "E", "F", "G", "H", "I"]
    
    private static func createMemoryGame() -> MemoryGame<String>{
        MemoryGame<String>(numberOfPairsOfCards: emojis.count)  { pairIndex in
            emojis[pairIndex]
        }
    }
    
    
    
    // MARK: - Access to the model
    var cards:Array<Card> {
        model.cards
    }
    
    // MARK: -Intent(s)
    func choose(_ card: Card) {
        model.choose(card)
    }
    
}


