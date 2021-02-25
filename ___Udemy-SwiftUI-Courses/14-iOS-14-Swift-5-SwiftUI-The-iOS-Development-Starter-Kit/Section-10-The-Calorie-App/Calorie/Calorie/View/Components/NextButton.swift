//
//  NextButton.swift
//  Calorie
//
//  Created by Pao Yu on 2020-07-30.
//

import SwiftUI

struct NextButton: View {
    
    @Binding var index: Int
    
    var body: some View {
        
        Image(systemName: "chevron.right.circle.fill")
            .font(.largeTitle)
            .foregroundColor(Color(.systemBlue))
            .frame(height: 100)
            .padding(.top, 50)
            .onTapGesture {
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
