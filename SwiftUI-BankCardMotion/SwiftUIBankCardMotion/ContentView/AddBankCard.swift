//
//  AddBankCard.swift
//  SwiftUIBankCardMotion
//
//  Created by Luan Nguyen on 27/12/2020.
//

import SwiftUI

struct AddBankCard: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            Spacer()
            
            Button(action: {
                print("Button Pressed!")
            }) {
                ZStack {
                    Circle()
                        .frame(width: 64, height: 64)
                        .foregroundColor(colorScheme == .dark ? Color.white.opacity(0.05) : Color.black.opacity(0.05))
                    
                    Image(systemName: "plus")
                        .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                }
            }
        }
        .padding(.all, 32)
        .animation(.easeInOut)
    }
}
