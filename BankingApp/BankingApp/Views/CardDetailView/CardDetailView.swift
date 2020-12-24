//
//  CardDetailView.swift
//  BankingApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct CardDetailView: View {
    // MARK: - PROPERTIES
    @Binding var card: Card
    @ObservedObject var cardManager: CardManager
    @State var startAnimation = false
    
    // MARK: - BODY
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

                } //: ZSTACK
                .padding(.top, 48)
                .padding(.bottom, 48)

                ExpenceView(cardManager: cardManager)
                    .padding(.top, 20)
                    .padding(.bottom, 40)
                    .opacity(startAnimation ? 1.0 : 0.0)
                    .animation(Animation.easeIn(duration: 0.5).delay(1.5))
                Spacer()
            } //: VSTACK
        } //: ZSTACK
        .onAppear {
            withAnimation(Animation.linear(duration: 1.0)) {
                startAnimation = true
            }
        }
    }
}
