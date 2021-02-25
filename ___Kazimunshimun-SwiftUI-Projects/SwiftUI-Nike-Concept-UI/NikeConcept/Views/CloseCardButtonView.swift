//
//  CloseCardButtonView.swift
//  NikeConcept
//
//  Created by Anik on 6/11/20.
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
