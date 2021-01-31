//
//  CardsView.swift
//  SwiftUIAnimation
//
//  Created by Luan Nguyen on 04/01/2021.
//

import SwiftUI

struct CardsView: View {
    // MARK: - PROPERTIES
    @State var showCards = false
    @State var viewState = CGSize.zero
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            CardView(imageName: "image1", animationDuration: 1.2, showCards: $showCards, viewState: $viewState)
                .blur(radius: showCards ? 0 : 3) // 0 : 3
                .scaleEffect(showCards ? 0.95 : 0.9) // 0.95 : 0.9
                .offset(x: showCards ? 40 : 0 , y: showCards ? -200 : -40) // 40 : 0 --- -200 : -40
                
                
            CardView(imageName: "image2", animationDuration: 0.7, showCards: $showCards, viewState: $viewState)
                .blur(radius: showCards ? 0 : 3) // 0 : 3
                .scaleEffect(showCards ? 0.95 : 0.9) // 0.95 : 0.9
                .offset(x: showCards ? -40 : 0 , y: showCards ? 220 : 40) // -40 : 0 --- 220 : 40
            
            CardView(imageName: "image3", animationDuration: 1, showCards: $showCards, viewState: $viewState)
                .onTapGesture {
                    self.showCards.toggle()
            }
            // Add DragGesture
            .gesture(
                DragGesture()
                    .onChanged({ value in
                        self.viewState = value.translation
                        self.showCards = true
                    })
                    .onEnded({ value in
                        self.viewState = CGSize.zero
                        self.showCards = false
                    })
            )
        } //: ZSTACK
    }
}

// MARK: - PREVIEW
#if DEBUG
struct CardsView_Previews: PreviewProvider {
    static var previews: some View {
        CardsView()
    }
}
#endif
