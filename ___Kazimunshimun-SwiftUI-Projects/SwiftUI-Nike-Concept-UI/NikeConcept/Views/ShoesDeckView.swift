//
//  ShoesDeckView.swift
//  NikeConcept
//
//  Created by Anik on 6/11/20.
//

import SwiftUI

struct ShoesDeckView: View {
    @ObservedObject var shoeChooser: ShoeChooser
    var body: some View {
        ZStack {
            ForEach(Array(stride(from: shoeChooser.shoes.count - 1, through: 0, by: -1)), id: \.self) { i in
                ShoeCardView(shoe: shoeChooser.shoes[i], shoeChooser: shoeChooser)
                    .rotationEffect(i == 0 ? .zero : .degrees(i%2 == 0 ? -5 : 5), anchor: .bottom)
            }
        }
    }
}

struct ShoeCardView: View {
    let shoe: ShoeItem
    @ObservedObject var shoeChooser: ShoeChooser
    
    @State var translation: CGSize = .zero
    @State var endingSwipe = false
    
    var swipeGesture: some Gesture {
        DragGesture()
            .onChanged { value in
                translation = value.translation
            }
            .onEnded { value in
                withAnimation {
                    endingSwipe = true
                    
                    if translation.width > 100 {
                        translation.width = 300
                        //end swipe with delete
                        shoeChooser.endSwipeWithDelete(shoe: shoe)
                    } else if translation.width < -100 {
                        translation.width = -300
                        // end swipe with favorite
                        shoeChooser.endSwipeWithFavorite(shoe: shoe)
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        self.translation = .zero
                        self.endingSwipe = false
                    }
                }
            }
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.init(white: 0.97))
                .frame(width: 240, height: 320)
            
            HStack {
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(.red)
                    .opacity(translation.width > 100 ? 1.0 : 0.0)
                
                Spacer()
                
                Image(systemName: "heart.circle")
                    .foregroundColor(.green)
                    .opacity(translation.width < -100 ? 1.0 : 0.0)
            }
            .frame(width: 210, height: 300, alignment: .top)
            .font(.system(size: 38))
            
            VStack {
                Image(shoe.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 210)
                
                Text(shoe.name)
                    .font(.system(size: 18, weight: .black))
                    .multilineTextAlignment(.center)
                    .frame(width: 220, height: 50)
                    .fixedSize()
                    .foregroundColor(Color.init(white: 0.4))
                    .animation(.none)
            }
        }
        .offset(x: translation.width)
        .rotationEffect(.degrees(Double(translation.width/240 * 25)), anchor: .bottom)
        .gesture(swipeGesture)
        .opacity(endingSwipe ? 0.0 : 1.0)
    }
}
