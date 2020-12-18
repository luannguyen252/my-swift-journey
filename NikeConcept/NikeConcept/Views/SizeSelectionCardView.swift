//
//  SizeSelectionCardView.swift
//  NikeConcept
//
//  Created by Luan Nguyen on 18/12/2020.
//

import SwiftUI

struct SizeSelectionCardView: View {
    // MARK: - PROPERTIES
    let shoe: ShoeItem
    @Binding var showSizeView: Bool
    @State var startAnimation = false

    // MARK: - BODY
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.black.opacity(0.5).ignoresSafeArea()
            
            Group {
                //: CARD BACKGROUND
                RoundedRectangle(cornerRadius: 30)
                    .fill(Color.white)
                    .frame(height: 400)
                    .padding(.horizontal)
                
                VStack(spacing: 24) {
                    //: CLOSE CARD BUTTON
                    CloseCardButtonView(showSizeView: $showSizeView, startAnimation: $startAnimation)
                    //: SHOE INFORMATION
                    ShoeInfoView(shoe: shoe)
                    //: SIZE INFORMATION VIEW
                    SizeInfoView(shoe: shoe)
                    //: ADD TO BAG BUTTON
                    Button(action: { }, label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 22)
                                .fill(Color.orange)
                                .frame(height: 44)
                            Text("Add to bag")
                                .foregroundColor(.white)
                        } //: ZSTACK
                        .padding(.vertical)
                    })
                } //: VSTACK
                .padding(.horizontal, 32)
            } //: GROUP
            .animation(.easeIn(duration: 0.5))
            .offset(y: startAnimation ? 0 : 500)
        } //: ZSTACK
        .onAppear {
            withAnimation { startAnimation.toggle() }
        }
    }
}

// MARK: - SHOW INFO VIEW
struct ShoeInfoView: View {
    // MARK: - PROPERTIES
    let shoe: ShoeItem

    // MARK: - BODY
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 4) {
                Text("Men's shoe")
                    .font(.system(size: 13, weight: .bold))
                    .foregroundColor(.gray)
                Text(shoe.name)
                    .font(.system(size: 16, weight: .bold))
            } //: VSTACK
            
            Spacer()
            
            Text("\(String.init(format: "%.0f", shoe.price)) $")
                .font(.system(size: 22, weight: .bold))
        } //: HSTACK
    }
}
