//
//  ContentView.swift
//  LearnByDoing
//
//  Created by Sandesh on 22/03/20.
//  Copyright © 2020 Sandesh. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    //MARK:- PROPERTIES
    var cards: [Card] = cardData
    
    //MARK:- CONTENT
    var body: some View {
        ZStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center, spacing: 20) {
                    ForEach(cards) { card in
                        CardView(card: card)
                        
                    }
                }
                .padding(20)
            }
        }
    }
}


//MARK:- PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(cards: cardData)
            .previewDevice("iPhone 11 Pro")
    }
}
