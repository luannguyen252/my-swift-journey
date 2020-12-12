//
//  CardView.swift
//  StackedCarouselSlider
//
//  Created by Luan Nguyen on 12/12/2020.
//

import SwiftUI

struct CardView: View {
    // MARK: - PROPERTIES
    var card: Book
    
    // MARK: - BODY
    var body: some View {
        VStack {
            Spacer(minLength: 0)
            HStack {
                Button(action: {}) {
                    Text("Read Now")
                        .font(.system(size: 16))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 16)
                        .background(Color("dark"))
                        .clipShape(Capsule())
                }
                Spacer(minLength: 0)
            } //: HSTACK
            .padding()
            .padding(.bottom, 10)
        }
        
    }
}
