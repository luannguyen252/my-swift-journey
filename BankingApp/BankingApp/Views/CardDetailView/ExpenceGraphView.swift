//
//  ExpenceGraphView.swift
//  BankingApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct ExpenceGraphView: View {
    // MARK: - PROPERTIES
    @ObservedObject var cardManager: CardManager
    @State var startAnimation = false
    
    // MARK: - BODY
    var body: some View {
        VStack {
            GeometryReader { geometry in
                ZStack {
                    GraphBackgroundView()
                    ExpenceBarGraph(cardManager: cardManager, heigth: geometry.size.height)
                       // .zIndex(2.0)
                    ExpenceLineGraph(data: cardManager.getExpencesDataBasedOnHeight(maxHeight: geometry.size.height - 40))
                        .trim(to: startAnimation ? 1 : 0)
                        .stroke(lineWidth: 4.0)
                        .foregroundColor(ColorConstants.graphLine)
                        .animation(Animation.easeIn(duration: 2.0).delay(2.0))
                        .zIndex(1.0)
                } //: ZSTACK
                .onAppear {
                    withAnimation {
                        startAnimation = true
                    }
                }
            } //: GEOMETRY READER
            .padding(.leading, 20)
            .padding(.trailing, 20)
            
            HStack {
                ForEach(expences) { expence in
                    Text(expence.month)
                        .font(.caption)
                        .frame(width: 45)
                }
            } //: HSTACK
            .foregroundColor(.white)
        } //: VSTACK
    }
}
