//
//  CardView.swift
//  SwiftUIAnimation
//
//  Created by Luan Nguyen on 04/01/2021.
//

import SwiftUI

struct CardView: View {
    // MARK: - PROPERTIES
    var imageName: String
    var animationDuration: Double
    
    @Binding var showCards: Bool
    @Binding var viewState: CGSize
    
    // MARK: - BODY
    var body: some View {
        Image(imageName)
            .resizable()
            .renderingMode(.original)
            .aspectRatio(contentMode: .fit)
            .frame(width: 370, height: 240)
            .cornerRadius(20)
            .shadow(radius: 10)
            .offset(x: viewState.width, y: viewState.height)
            .rotationEffect(Angle(degrees: showCards ? 10 : 0)) // 10 : 0
            .animation(.easeInOut(duration: animationDuration))
    }
}

// MARK: - PREVIEW
#if DEBUG
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(imageName: "image1", animationDuration: 1, showCards: .constant(false), viewState: .constant(.zero))
    }
}
#endif
