//
//  Layout3.swift
//  Compositional Layout (iOS)
//
//  Created by Balaji on 31/12/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct Layout3: View {
    var cards: [Card]
    var body: some View {
        
        HStack(spacing: 4){
            
            VStack(spacing: 4){
                
                // 123+123+4 = 250
                if cards.count >= 2{
                    
                    AnimatedImage(url: URL(string: cards[1].download_url))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: ((width / 3)), height: 123)
                        .cornerRadius(4)
                        .modifier(ContextModifier(card: cards[1]))
                }
                
                if cards.count == 3{
                    
                    AnimatedImage(url: URL(string: cards[2].download_url))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: ((width / 3)), height: 123)
                        .cornerRadius(4)
                        .modifier(ContextModifier(card: cards[2]))
                }
            }
            .frame(maxHeight: .infinity, alignment: .top)
            
            AnimatedImage(url: URL(string: cards[0].download_url))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: (width - (width / 3) + 4), height: 250)
                .cornerRadius(4)
                .modifier(ContextModifier(card: cards[0]))
        }
        .frame(maxWidth: .infinity, alignment: .trailing)
    }
}

struct Layout3_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
