//
//  NextButton.swift
//  Index
//
//  Created by Pao Yu on 2020-07-31.
//

import SwiftUI

struct NextButton: View {
    
    @Binding var activeCardIndex: Int
    
    var body: some View {
        Image(systemName: "chevron.right.circle.fill")
            .font(.largeTitle)
            .foregroundColor(Color(.systemGreen))
            .frame(height: 100)
            .padding(.top, 50)
            .onTapGesture(perform: moveToNextCard)
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
