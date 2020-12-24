//
//  ExpenceBarGraph.swift
//  BankingApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct ExpenceBarGraph: View {
    // MARK: - PROPERTIES
    @ObservedObject var cardManager: CardManager
    let heigth: CGFloat
    
    // MARK: - BODY
    var body: some View {
        HStack(alignment: .bottom) {
            ForEach(cardManager.expencesValue) { expence in
                VStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(ColorConstants.secondary)
                            .frame(width: 60, height: 30)
                        Text("$ \(String(format: "%.2f", expence.amount))")
                            .font(.system(size: 9))
                            .foregroundColor(.white)
                    }
                    .offset(y: -20.0)
                    .opacity(expence.selected ? 1.0 : 0.0)
                    
                    ZStack(alignment: .bottom) {
                        Rectangle()
                            .fill(expence.selected ? ColorConstants.barHighlightedBackground : ColorConstants.barBackground)
                            .frame(width: 45, height: getHeightOfBar(maxHeight: heigth - 40, amount: expence.amount))
                            .onTapGesture {
                                withAnimation {
                                    cardManager.selectExpence(expence: expence)
                                }
                        }
                        
                        Line()
                            .stroke(ColorConstants.graphLine, lineWidth: 2.0)
                            .frame(width: 45, height: 2)
                            .opacity(expence.selected ? 1.0 : 0.0)
                    } //: ZSTACK
                } //: VSTACK
                .frame(width: 45)
                .animation(Animation.linear.delay(0.0))
                
            }
        } //: HSTACK
    }
    
    // MARK: - GET HEIGHT OF BAR
    func getHeightOfBar(maxHeight: CGFloat, amount: Float) -> CGFloat {
        let max = cardManager.getMaxExpences()
        let fraction: CGFloat = CGFloat(amount / max)
        let barHeight = CGFloat(fraction * maxHeight)
        
        return barHeight
    }
}
