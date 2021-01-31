//
//  CardBackView.swift
//  SwiftUIBankCardAnimation
//
//  Created by Luan Nguyen on 03/01/2021.
//

import SwiftUI

struct CardBackView: View {
    // MARK: - PROPERTIES
    let width: CGFloat
    let ratioConstant: CGFloat = 1.593
    let card: Card
    
    // MARK: - BODY
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
            LinearGradient(gradient: Gradient(colors: [card.cardPalatte.colorTwo.opacity(0.9), card.cardPalatte.colorOne.opacity(0.9)]), startPoint: .trailing, endPoint: .leading)
            
            VStack {
                Rectangle()
                    .frame(height: 40)
                    .opacity(0.5)
                    .foregroundColor(.black)
                    .overlay(
                        Rectangle()
                            .frame(width: 180, height: 38)
                            .cornerRadius(3)
                            .foregroundColor(.white)
                            .overlay(
                                HStack {
                                    Spacer()
                                    Text(card.security)
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .semibold, design: .monospaced))
                                        .opacity(0.75)
                                }.padding()
                            )
                            .offset(x: 40)
                    )
                
                Spacer()
                
                Text(card.cardNumber)
                    .font(.system(size: width * 0.065, weight: .bold, design: .monospaced))
                    .foregroundColor(.white)
                    .opacity(0.35)
                    .shadow(color: Color.black, radius: 5)
                    .rotation3DEffect(.degrees(180), axis: (x: 0.0, y: 1.0, z: 0.0))
                    .animation(Animation.default)
                    .offset(y: -12)
                
                Spacer()
                
                Spacer()
            } //: VSTACK
            .padding(.top, 24)
        } //: ZSTACK
        .shadow(radius: 5)
        .cornerRadius(20)
        .frame(width: width, height: width / ratioConstant)
    }
}

// MARK: - PREVIEW
#if DEBUG
struct CardBackView_Previews: PreviewProvider {
    static var previews: some View {
        CardBackView(width: UIScreen.main.bounds.width * 0.85, card: AppConstants.cards[0])
    }
}
#endif
