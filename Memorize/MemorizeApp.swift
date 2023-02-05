//
//  MemorizeApp.swift
//  Memorize
//
//  Created by 李金良 on 2023/2/1.
//

import SwiftUI

@main
struct MemorizeApp: App {
    
    private let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
                .preferredColorScheme(.dark)
        }
    }
}
