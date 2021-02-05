import SwiftUI
import PlaygroundSupport

// Constants
let cardWidth: CGFloat = 343
let cardHeight: CGFloat = 212
let spacing = 36
let animation = Animation.spring()
let cardColors = [
    Color(UIColor.systemRed),
    Color(UIColor.systemOrange),
    Color(UIColor.systemYellow),
    Color(UIColor.systemGreen),
    Color(UIColor.systemBlue),
    Color(UIColor.systemIndigo),
    Color(UIColor.systemPurple)
]

class Wallet: ObservableObject {
    @Published var cards: [Card] = []
    
    init() {
        // Loop through the card colors to set up our wallet
        for i in 0..<cardColors.count {
            let card = Card(backgroundColor: cardColors[i], yOffset: CGFloat(i * spacing))
            self.cards.append(card)
        }
    }
    
    func resetCards() {
        // Reset the wallet back to its normal state
        for (i, card) in self.cards.enumerated() {
            withAnimation(animation) {
                card.yOffset = CGFloat(i * spacing)
            }
        }
    }
    
    func tapCard(card: Card) {
        // When you tap on a card in the wallet
        let tappedCardIndex = cards.index { $0.id == card.id }!
        var cardPadding = spacing
        
        // Restore cards to their original positions
        self.resetCards()
        
        if card.tapped {
            card.tapped = false
            
            withAnimation(animation) {
                card.flipped = false
            }
        } else {
            card.tapped = true
            withAnimation(animation) {
                // Move tapped card to the top
                card.yOffset = 0
            }
            
            for (i, walletCard) in self.cards.enumerated() {
                if walletCard.id == card.id {
                    // Skip the card we tapped
                    continue
                } else {
                    walletCard.tapped = false
                    withAnimation(animation) {
                        walletCard.flipped = false
                    }
                    if i > tappedCardIndex {
                        // Remove additional spacing between cards beneath the tapped card
                        cardPadding = 0
                    }
                    
                    withAnimation(animation) {
                        walletCard.yOffset = cardHeight + CGFloat(cardPadding) + walletCard.yOffset
                    }
                }
            }
        }
        
    }
}

class Card: ObservableObject, Identifiable {
    var id = UUID()
    var last4: String = "9999"
    var tapped = false
    @Published var flipped = false
    @Published var backgroundColor: Color
    @Published var yOffset: CGFloat
    
    init(backgroundColor: Color, yOffset: CGFloat) {
        self.backgroundColor = backgroundColor
        self.yOffset = yOffset
        self.last4 = randomNumber(digits: 4)
    }
    
    func randomNumber(digits: Int) -> String {
        // Generate random last 4 digits
        var number = String()
        for _ in 1...digits {
            number += "\(Int.random(in: 1...9))"
        }
        return number
    }
}

struct WalletView: View {
    @ObservedObject var wallet: Wallet
    
    var body: some View {
        VStack {
            ZStack(alignment: .top) {
                ForEach(self.wallet.cards, id: \.id) { card in
                    CardView(card: card)
                        .tappable(wallet: self.wallet, card: card)
                }
            }
            Spacer()
        }
        .padding()
    }
}

struct CardView: View {
    @ObservedObject var card: Card
    
    var flippedToggle: some View {
        HStack {
            Spacer()
            
            if self.card.tapped {
                Button(action: {
                    withAnimation(.spring()) {
                        self.card.flipped.toggle()
                    }
                }) {
                    Image(systemName: self.card.flipped ? "xmark.circle.fill" : "ellipsis.circle.fill")
                        .font(.system(size: 22))
                        .foregroundColor(.white)
                }
            }
        }
    }
    
    var cardFront: some View {
        VStack {
            HStack {
                Spacer()
                self.flippedToggle
            }
            
            Spacer()
            
            HStack {
                Text("•••• \(card.last4)")
                    .font(.system(size: 16, design: .monospaced))
                    .foregroundColor(.white)
                Spacer()
            }
        }
    }
    
    var cardBack: some View {
        VStack {
            HStack {
                Spacer()
                self.flippedToggle
            }
            
            Divider()
                .padding(.vertical)
            
            Spacer()
            
            HStack {
                Text("1234")
                Spacer()
                Text("5678")
                Spacer()
                Text("9012")
                Spacer()
                Text(card.last4)
            }
            .padding(.horizontal)
            .font(.system(size: 18, weight: .semibold, design: .monospaced))
            .foregroundColor(.white)
            
            Spacer()
            
            HStack {
                Text("lil card")
                Spacer()
                Text("1 (800) lil-software")
            }
            .font(.caption)
            .foregroundColor(.white)
        }
        .rotation3DEffect(.degrees(-180), axis: (x: 0, y: 1, z: 0))
    }
    
    var body: some View {
        VStack {
            if card.flipped {
                cardBack
            } else {
                cardFront
            }
        }
        .padding()
        .frame(width: cardWidth, height: cardHeight)
        .background(card.backgroundColor)
        .cornerRadius(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color(UIColor.black.withAlphaComponent(0.12)), lineWidth: 1)
                .shadow(color: Color(UIColor.white.withAlphaComponent(0.12)), radius: 0.5, x: 0, y: 1)
            
        )
            .shadow(color: Color(UIColor.black.withAlphaComponent(0.12)), radius: 16, x: 0, y: 8)
    }
}

struct TappableView: ViewModifier {
    @ObservedObject var wallet: Wallet
    @ObservedObject var card: Card
    
    func body(content: Content) -> some View {
        content
            .onTapGesture(perform: {
                self.wallet.tapCard(card: self.card)
            })
            .offset(y: card.yOffset)
            .rotation3DEffect(.degrees(card.tapped ? 0 : isAnyCardTapped() ? -8 : 0), axis: (x: 1, y: 0, z: 0))
            .rotation3DEffect(.degrees(card.flipped ? -180 : 0), axis: (x: 0, y: 1, z: 0))
    }
    
    func isAnyCardTapped() -> Bool {
        for card in self.wallet.cards {
            if card.tapped {
                return true
            }
        }
        
        return false
    }
}

extension View {
    func tappable(wallet: Wallet, card: Card) -> some View {
        return modifier(TappableView(wallet: wallet, card: card))
    }
}

PlaygroundPage.current.setLiveView(WalletView(wallet: Wallet()))
