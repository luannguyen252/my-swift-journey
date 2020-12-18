//
//  CloseCardButtonView.swift
//  NikeConcept
//
//  Created by Luan Nguyen on 18/12/2020.
//

import SwiftUI

struct CloseCardButtonView: View {
    @Binding var showSizeView: Bool
    @Binding var startAnimation: Bool
    
    var body: some View {
        HStack {
            Spacer()
            Button(action: {
                withAnimation { startAnimation.toggle() }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.showSizeView = false
                }
            }, label: {
                Image(systemName: "xmark")
                    .padding()
                    .foregroundColor(.black)
            })
        }
    }
}
