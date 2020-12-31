//
//  CardView.swift
//  SwiftUIHeroCarouselSlider
//
//  Created by Luan Nguyen on 30/12/2020.
//

import SwiftUI

struct CardView: View {
    @EnvironmentObject var model: CarouselViewModel
    var card: Card
    var animation: Namespace.ID

    var body: some View {
        VStack {
            Text("Thursday 31 December")
                .font(.caption)
                .foregroundColor(Color.white.opacity(0.85))
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding()
                .padding(.top, 16)
                .matchedGeometryEffect(id: "Date-\(card.id)", in: animation)
            
            HStack {
                Text(card.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(width: 250, alignment: .leading)
                    .padding()
                    .matchedGeometryEffect(id: "Title-\(card.id)", in: animation)
                
                Spacer(minLength: 0)
            } //: HSTACK
            
            Spacer(minLength: 0)
            
            HStack {
                Spacer(minLength: 0)
                
                if !model.showContent {
                    Text("Read More")
                    Image(systemName: "arrow.right")
                }
            } //: HSTACK
            .foregroundColor(Color.white.opacity(0.9))
            .padding(48)
        } //: VSTACK
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            card.cardColor
                .cornerRadius(32)
                .matchedGeometryEffect(id: "bgColor-\(card.id)", in: animation)
        ) //: BACKGROUND
        .onTapGesture {
            withAnimation(.spring()) {
                model.selectedCard = card
                model.showCard.toggle()
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    withAnimation(.easeIn) {
                        model.showContent = true
                    }
                }
            }
        } //: ON TAP GESTURE
    }
}

#if DEBUG
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
