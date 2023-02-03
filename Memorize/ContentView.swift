
import SwiftUI


struct ContentView: View {
    
    let viewModel: EmojiMemoryGame
    
    var body: some View {
        
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
                ForEach(viewModel.cards) {card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture { viewModel.choose(card: card) }
                }
            }
        }
        
        .foregroundColor(.red)
        .padding()
        .font(Font.largeTitle)
    }
}


struct CardView: View {
    
    let card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20.0)
            if card.isFaceup {
                shape.fill(Color.white)
                shape.stroke(lineWidth: 3)
                Text(card.content)
            } else {
                shape.fill()
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        let game = EmojiMemoryGame()
        
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
        ContentView(viewModel: game)
        
    }
}
