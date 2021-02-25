//
//  SizeSelectionCardView.swift
//  NikeConcept
//
//  Created by Anik on 6/11/20.
//

import SwiftUI

struct SizeSelectionCardView: View {
    let shoe: ShoeItem
    @Binding var showSizeView: Bool
    @State var startAnimation = false

    var body: some View {
        ZStack(alignment: .bottom) {
            Color.black.opacity(0.5).ignoresSafeArea()
            
            Group {
                // card background
                RoundedRectangle(cornerRadius: 30)
                    .fill(Color.white)
                    .frame(height: 400)
                    .padding(.horizontal)
                
                VStack(spacing: 24) {
                    // close card button
                    CloseCardButtonView(showSizeView: $showSizeView, startAnimation: $startAnimation)
                    // shoe info
                    ShoeInfoView(shoe: shoe)
                    // size info view
                    SizeInfoView(shoe: shoe)
                    // add to bag button
                    Button(action: {
                        
                    }, label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 22)
                                .fill(Color.orange)
                                .frame(height: 44)
                            Text("Add to bag")
                                .foregroundColor(.white)
                        }
                        .padding(.vertical)
                    })
                }
                .padding(.horizontal, 32)
            }
            .animation(.easeIn(duration: 0.5))
            .offset(y: startAnimation ? 0 : 500)
        }
        .onAppear {
            withAnimation { startAnimation.toggle() }
        }
    }
}

struct ShoeInfoView: View {
    let shoe: ShoeItem
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 4) {
                Text("Men's shoe")
                    .font(.system(size: 13, weight: .bold))
                    .foregroundColor(.gray)
                Text(shoe.name)
                    .font(.system(size: 16, weight: .bold))
            }
            
            Spacer()
            
            Text("\(String.init(format: "%.0f", shoe.price)) $")
                .font(.system(size: 22, weight: .bold))
        }
    }
}
