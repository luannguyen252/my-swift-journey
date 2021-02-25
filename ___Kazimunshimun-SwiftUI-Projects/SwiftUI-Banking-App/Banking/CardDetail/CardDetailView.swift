//
//  CardDetailView.swift
//  Banking
//
//  Created by Anik on 1/8/20.
//

import SwiftUI

struct CardDetailView: View {
    @Binding var card: Card
    @ObservedObject var cardManager: CardManager
    @State var startAnimation = false
    var body: some View {
        ZStack {
            Rectangle()
                .fill(ColorConstants.primary)
                
            VStack {
                CardDetailTopBarView(card: $card)
                
                ZStack {
                    GeometryReader { geometry in
                        CardView(card: card)
                            .rotationEffect(startAnimation ? Angle.degrees(90) : Angle.degrees(0))
                            .offset(x: startAnimation ? -geometry.size.width/2 : 0)
                    }
                    .frame(height: 210)

                    CardInfoView()
                        .padding(.leading, 80)
                        .opacity(startAnimation ? 1.0 : 0.0)
                        .animation(Animation.easeIn(duration: 0.5).delay(1.0))
                    
                }
                .padding(.top, 20)
                .padding(.bottom, 20)
                
                ExpenceView(cardManager: cardManager)
                    .padding(.top, 20)
                    .padding(.bottom, 40)
                    .opacity(startAnimation ? 1.0 : 0.0)
                    .animation(Animation.easeIn(duration: 0.5).delay(1.5))
                Spacer()
            }
        }
        .onAppear {
            withAnimation(Animation.linear(duration: 1.0)) {
                startAnimation = true
            }
            
        }
    }
}

struct CardDetailTopBarView: View {
    @Binding var card: Card
    var body: some View {
        HStack {
            Button(action: {
                withAnimation {
                    card.selected = false
                }
            }, label: {
                Image(systemName: "multiply")
                    .padding(.all, 20)
            })
            
            Text("CARD DETAILS")
                .kerning(2.0)
                .bold()
            
            Spacer()
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "slider.vertical.3")
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
