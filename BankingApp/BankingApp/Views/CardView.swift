//
//  CardView.swift
//  BankingApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct CardView: View {
    // MARK: - PROPERTIES
    let card: Card
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 24)
                .fill(ColorConstants.cardBackground)
                .shadow(color: ColorConstants.cardTopRight.opacity(0.5), radius: 16, x: 0, y: 8)
            
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text(card.company.uppercased())
                            .font(.system(size: 14))
                            .bold()
                            .kerning(2.0)
                        Text(card.type.rawValue.uppercased())
                            .font(.system(size: 14))
                            .bold()
                            .kerning(2.0)
                    }
                    
                    Spacer()
                    
                    Text(card.company.uppercased())
                        .font(.system(size: 24, weight: Font.Weight.heavy))
                        .italic()
                } //: HSTACK
                
                Spacer()
                
                HStack {
                    ForEach(0..<3) { i in
                        Text("****")
                            .kerning(3.0)
                        
                        Spacer()
                    }
                    
                    Text(card.getLastForDigit())
                        .kerning(3.0)
                } //: HSTACK
            } //: VSTACK
            .padding(.all, 40)
            
        } //: ZSTACK
        .foregroundColor(.white)
        .padding(.leading, 16)
        .padding(.trailing, 16)
    }
}
