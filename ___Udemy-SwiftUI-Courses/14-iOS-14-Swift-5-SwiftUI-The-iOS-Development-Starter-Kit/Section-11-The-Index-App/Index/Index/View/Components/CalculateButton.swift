//
//  CalculateButton.swift
//  Index
//
//  Created by Pao Yu on 2020-07-31.
//

import SwiftUI

struct CalculateButton: View {
    
    @EnvironmentObject var model: IndexModel
    @Binding var activeCardIndex: Int
    
    var body: some View {
        Text("CALCULATE")
            .font(.caption2)
            .fontWeight(.bold)
            .padding(.all, 8)
            .foregroundColor(Color(.white))
            .background(Color(.systemGreen))
            .cornerRadius(20)
            .frame(height: 100)
            .padding(.top, 50)
            .onTapGesture {
                model.calculateBMI()
                moveToNextCard()
            }
    }
    
    func moveToNextCard() {
        withAnimation {
            if activeCardIndex < 4 {
                activeCardIndex += 1
            } else {
                activeCardIndex = 0
            }
        }
    }
}

