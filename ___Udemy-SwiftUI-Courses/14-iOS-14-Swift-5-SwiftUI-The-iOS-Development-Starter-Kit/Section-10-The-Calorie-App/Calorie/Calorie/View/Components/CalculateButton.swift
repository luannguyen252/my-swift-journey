//
//  CalculateButton.swift
//  Calorie
//
//  Created by Pao Yu on 2020-07-30.
//

import SwiftUI

struct CalculateButton: View {
    
    @EnvironmentObject var model: CalorieModel
    
    @Binding var index: Int
    
    var body: some View {
        Text("CALCULATE")
            .font(.caption2)
            .fontWeight(.bold)
            .padding(.all, 8)
            .foregroundColor(Color(.white))
            .background(Color(.systemBlue))
            .cornerRadius(20)
            .frame(height: 100)
            .padding(.top, 50)
            .onTapGesture {
                model.calculateBMR()
                moveToNextCard()
            }
    }
    
    func moveToNextCard() {
        withAnimation {
            if index < 5 {
                index += 1
            } else {
                index = 0
            }
        }
    }
}
