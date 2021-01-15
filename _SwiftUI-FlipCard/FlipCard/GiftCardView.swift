//
//  GiftCardView.swift
//  FlipCard
//
//  Created by Leonardo Bilia on 6/30/19.
//  Copyright © 2019 Leonardo Bilia. All rights reserved.
//

import SwiftUI

struct GiftCardView : View {
    
    @State private var isFlipped: Bool = false
    
    var body: some View {
        
        VStack {
            Image(isFlipped ? "itunes_card_2" : "itunes_card_1")
                .resizable()
                .frame(width: 255, height: 365)
                .rotation3DEffect(Angle(degrees: isFlipped ? 180 : 0), axis: (x: 0, y: 1, z: 0))
                .gesture(TapGesture().onEnded {
                    withAnimation(.spring()) {
                        self.isFlipped.toggle()
                    }
                })
            
            Text(isFlipped ? "Best Value" : "Starting At Only")
                .font(.headline)
            
            Spacer()
            Text("Need help choosing the best gift card?")
                .font(.footnote)
        }
    }
}

#if DEBUG
struct GiftCardView_Previews : PreviewProvider {
    static var previews: some View {
        GiftCardView()
    }
}
#endif
