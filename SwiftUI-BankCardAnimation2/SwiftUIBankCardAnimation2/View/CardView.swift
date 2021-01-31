//
//  CardView.swift
//  SwiftUIBankCardAnimation2
//
//  Created by Luan Nguyen on 03/01/2021.
//

import SwiftUI

struct CardView: View {
    // MARK: - CARD MODEL
    let card: Card
    
    // MARK: - ANIMATABLE
    var flarePosition: UnitPoint = UnitPoint(x: 0.3, y: 0.2)
    var animatableData: UnitPoint {
        get { return flarePosition }
        set { flarePosition = newValue }
    }
    
    // MARK: - PRIVATE
    private let currencyFormatter: NumberFormatter = {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.currencySymbol = "$"
        currencyFormatter.locale = Locale(identifier: "en")
        
        return currencyFormatter
    }()
    
    // MARK: - BODY
    var body: some View {
        // MARK: - GRADIENT COLOR
        let gradient = RadialGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9607843161, green: 0.9607843161, blue: 0.9607843161, alpha: 0.1)), Color(#colorLiteral(red: 0.2784313725, green: 0.3019607843, blue: 0.3294117647, alpha: 0))]),
                                      center: flarePosition,
                                      startRadius: 50,
                                      endRadius: 300)
        
        return ZStack {
            Color(card.color).cornerRadius(16)
            
            HStack {
                VStack(alignment: .leading) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("BALANCE")
                            .foregroundColor(Color.white)
                            .font(.caption)
                            .fontWeight(.medium)
                        
                        Text(currencyFormatter.string(from: NSNumber(value: card.balance)) ?? "")
                            .foregroundColor(Color.white)
                            .fontWeight(.heavy)
                            .font(.custom("Courier", size: 28))
                    }
                    
                    Spacer()
                    
                    Image("chip")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text(card.cardNumber)
                            .foregroundColor(Color.white)
                            .font(.custom("Courier", size: 24))
                            .fontWeight(.bold)
                        
                        Text(card.cardHolderName)
                            .foregroundColor(Color.white)
                            .font(.custom("Courier", size: 14))
                            .opacity(0.6)
                    }
                    .padding(.top, 8)
                    
                } //: VSTACK
                
                Spacer()
            } //: HSTACK
            .padding(18)
            
            VStack {
                HStack {
                    Spacer()
                    
                    Image(uiImage: card.serviceLogo)
                } //: HSTACK
                Spacer()
            } //: VSTACK
            .padding(18)
            
            gradient
                .cornerRadius(16)
        }
        .aspectRatio(1.586, contentMode: .fit)
    }
}

// MARK: - PREVIEW
#if DEBUG
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: TestData.cards.first!)
        .padding(32)
    }
}
#endif
