//
//  CardDetailTopBarView.swift
//  BankingApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct CardDetailTopBarView: View {
    // MARK: - PROPERTIES
    @Binding var card: Card
    
    // MARK: - BODY
    var body: some View {
        HStack {
            Button(action: {
                withAnimation {
                    card.selected = false
                }
            }, label: {
                Image(systemName: "multiply")
                    .font(.title2)
                    .padding(.all, 16)
            })

            Text("Card Details")
                .kerning(1.5)
                .font(.system(size: 24))
                .fontWeight(.heavy)

            Spacer()

            Button(action: {
                print("Button Pressed!")
            }, label: {
                Image(systemName: "slider.vertical.3")
                    .font(.title2)
                    .padding(.all, 16)
            })
        } //: HSTACK
        .foregroundColor(.white)
        .padding(.top, 64)
        .padding(.bottom, 32)
        .padding(.leading, 16)
        .padding(.trailing, 16)
    }
}
