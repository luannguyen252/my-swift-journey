//
//  ContentView.swift
//  BankingApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    @ObservedObject var cardManager = CardManager()
    @State private var currentPage = 0
    @State var selecedCard: Card
    @State var startAnimation = false
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Rectangle()
                .fill(ColorConstants.primary)
            
            VStack {
                TopBarView()
                
                PagerView(pageCount: cards.count, currentIndex: $currentPage) {
                    ForEach(cards) { card in
                        CardView(card: card)
                            .onTapGesture {
                                withAnimation {
                                    selecedCard = card
                                    selecedCard.selected = true
                                }
                            }
                    }
                }
                .frame(height: 240)
                .opacity(startAnimation ? 1.0 : 0.0)
                .animation(Animation.easeIn(duration: 0.5))
                
                Group {
                    MenuHeaderView(title: "Transactions", imageName: "arrow.up.arrow.down")
                    TransactionListView(currentIndex: $currentPage, cardManager: cardManager)
                }
                .opacity(startAnimation ? 1.0 : 0.0)
                .animation(Animation.easeIn(duration: 0.5).delay(1.0))
                
                Spacer()
            } //: VSTACK
            
            if (selecedCard.selected) {
                CardDetailView(card: $selecedCard, cardManager: cardManager)
            }
        } //: ZSTACK
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            withAnimation {
                startAnimation.toggle()
            }
        }
    }
}

// MARK: - PREVIEW
#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(selecedCard: cards[0])
    }
}
#endif
