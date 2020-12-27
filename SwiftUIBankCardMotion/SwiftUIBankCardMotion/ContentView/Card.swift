//
//  Card.swift
//  SwiftUIBankCardMotion
//
//  Created by Luan Nguyen on 27/12/2020.
//

import SwiftUI

struct Card: View {
    @Binding var isCardTapped: Bool
    var card: CardStructure
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                Image(card.cardProviderLogo)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 40)
                    .padding(.trailing, 8)
            }
            
            Spacer()
            
            VStack(alignment: .leading, spacing: 8) {
                Text("\(card.cardName)")
                    .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                    .font(.system(size: 16))
                    .fontWeight(.regular)
                    .textCase(.uppercase)
                    .opacity(0.6)
                
                HStack {
                    HStack(alignment: .top, spacing: 0) {
                        Text("•••• •••• •••• \(String(card.cardNumber.suffix(4)))")
                            .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                            .font(.system(size: 24))
                            .fontWeight(.bold)
                    }
                    
                    Spacer()
                }
            }
        }
        .frame(width: 300, height: 200)
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: [card.linearColor1, card.linearColor2]), startPoint: .leading, endPoint: .trailing))
        .cornerRadius(16)
        .shadow(color: card.shadow.opacity(0.25), radius: 16, x: self.isCardTapped ? 0 : 8, y: 12)
        .scaleEffect(self.isCardTapped ? 1 : 1.20)
        .rotationEffect(Angle(degrees: self.isCardTapped ? 0 : 90))
        .offset(y: self.isCardTapped ? -200 : 0)
        .animation(.spring(response: 0.4, dampingFraction: 0.6, blendDuration: 0))
        .onTapGesture { self.isCardTapped.toggle() }
    }
}
