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
                    .padding(.all, 20)
            })

            Text("CARD DETAILS")
                .kerning(2.0)
                .bold()

            Spacer()

            Button(action: {
                print("Button Pressed!")
            }, label: {
                Image(systemName: "slider.vertical.3")
                    .padding(.all, 20)
            })
        } //: HSTACK
        .foregroundColor(.white)
        .padding(.top, 64)
        .padding(.bottom, 20)
        .padding(.leading, 20)
        .padding(.trailing, 20)
    }
}
