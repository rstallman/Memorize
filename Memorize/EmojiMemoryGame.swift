//
//  EmojiMeoryGame.swift
//  Memorize
//
//  Created by 李金良 on 2023/2/1.
//

import SwiftUI


class EmojiMemoryGame:ObservableObject {
    
    
    @Published private var model: MemoryGame<String> =  EmojiMemoryGame.createMemoryGame()
    
    
    static func createMemoryGame() -> MemoryGame<String>{
        let emojis = ["👻", "😀", "🎃", "A", "B", "C", "D", "E", "F", "G", "H", "I"]
        return  MemoryGame<String>(numberOfPairsOfCards: emojis.count)  { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    
    
    // MARK: - Access to the model
    var cards:Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: -Intent(s)
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
}


