//
//  ContentView.swift
//  Banking
//
//  Created by Anik on 30/7/20.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var cardManager = CardManager()
    @State private var currentPage = 0
    @State var selecedCard: Card
    @State var startAnimation = false
    
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
            }
            
            if (selecedCard.selected) {
                CardDetailView(card: $selecedCard, cardManager: cardManager)
            }
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            withAnimation {
                startAnimation.toggle()
            }
        }
    }
}

struct TopBarView: View {
    var body: some View {
        HStack {
            Button(action: {}, label: {
                Image(systemName: "line.horizontal.3")
                    .padding(.all, 20)
            })
            
            Text("HOME")
                .kerning(2.0)
                .bold()
            
            Spacer()
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "magnifyingglass")
                    .padding(.all, 20)
            })
        }
        .foregroundColor(.white)
        .padding(.top, 64)
        .padding(.bottom, 20)
        .padding(.leading, 20)
        .padding(.trailing, 20)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(selecedCard: cards[0])
    }
}
