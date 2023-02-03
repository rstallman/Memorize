
import SwiftUI



struct ContentView: View {
    var emojis = ["🚃", "😀", "👻", "🎃", "😱", "🚌", "🚉", "😍", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U"]
    @State var emojoCount = 20
    
    var body: some View{
        VStack {
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojoCount], id:\.self) { emoj in
                        CardView(content: emoj).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack {
                remove
                Spacer()
                add
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
        
    }
    
    var remove:some View {
        Button {
            if emojoCount > 1 {
                emojoCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
    }
    
    
    var add:some View{
        Button {
            if emojoCount < emojis.count {
                emojoCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
        }
    }
    
}


struct CardView: View {
    
    var content:String
    
    @State var isFaceup: Bool = true
    
    
    var body : some View {
        ZStack{
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceup {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceup = !isFaceup
        }
    }
}




struct ContentViewApp: View {
    var viewModel: EmojiMemoryGame
    
    var body: some View {
        HStack {
            ForEach(viewModel.cards) {card in
                CardViewOld(card: card).onTapGesture {
                    viewModel.choose(card: card)
                }
            }
        }
        .foregroundColor(Color.orange)
        .padding()
        .font(Font.largeTitle)
    }
}


struct CardViewOld: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            if card.isFaceup {
                RoundedRectangle(cornerRadius: 20.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 20.0).stroke(lineWidth: 3)
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: 20.0).fill()
            }
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
        
    }
}
