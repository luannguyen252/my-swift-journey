//
//  Home.swift
//  SwiftUIHeroCarouselSlider
//
//  Created by Luan Nguyen on 30/12/2020.
//

import SwiftUI

var width = UIScreen.main.bounds.width

struct Home: View {
    @EnvironmentObject var model: CarouselViewModel
    @Namespace var animation
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Button(action: {
                        print("Button Pressed!")
                    }, label: {
                        HStack {
                            Image(uiImage: #imageLiteral(resourceName: "profile"))
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 32, height: 32)
                                .cornerRadius(32)
                            
                            Text("Luan Nguyen")
                                .fontWeight(.bold)
                                .foregroundColor(Color("text"))
                                .padding(.leading, 4)
                        }
                    })
                    
                    Spacer()
                } //: HSTACK
                .padding()
                
                // MARK: - CAROUSEL
                ZStack {
                    ForEach(model.cards.indices.reversed(),id: \.self) { index in
                        HStack {
                            CardView(card: model.cards[index], animation: animation)
                                .frame(width: getCardWidth(index: index), height: getCardHeight(index: index))
                                .offset(x: getCardOffset(index: index))
                                .rotationEffect(.init(degrees: getCardRotation(index: index)))
                            
                            Spacer(minLength: 0)
                        } //: HSTACK
                        .frame(height: 450)
                        .contentShape(Rectangle())
                        .offset(x: model.cards[index].offset)
                        .gesture(DragGesture(minimumDistance: 0)
                                    .onChanged({ (value) in
                                        onChanged(value: value, index: index)
                                    }).onEnded({ (value) in
                                        onEnd(value: value, index: index)
                                    }))
                    }
                } //: ZSTACK
                .padding(.top, 24)
                .padding(.horizontal, 32)
                
                Button(action: ResetViews, label: {
                    Image(systemName: "arrow.clockwise")
                        .font(.system(size: 24, weight: .semibold))
                        .foregroundColor(Color("AccentColor"))
                        .padding()
                        .background(Color.white)
                        .clipShape(Circle())
                        .shadow(color: Color.black.opacity(0.1), radius: 16, x: 4, y: 0)
                })
                .padding(.top, 32)
                
                Spacer()
            } //: VSTACK
            .statusBar(hidden: true)
            
            // Show Card Details
            if model.showCard {
                DetailView(animation: animation)
            }
        } //: ZSTACK
    }
    
    // MARK: - RESET VIEWS
    func ResetViews() {
        for index in model.cards.indices {
            withAnimation(.spring()) {
                model.cards[index].offset = 0
                model.swipedCard = 0
            }
        }
    }
    
    // On Changed Drag Gesture
    func onChanged(value: DragGesture.Value, index: Int) {
        /// Only Left Swipe
        if value.translation.width < 0 {
            model.cards[index].offset = value.translation.width
        }
    }
    
    // On End Drag Gesture
    func onEnd(value: DragGesture.Value, index: Int) {
        withAnimation {
            if -value.translation.width > width / 3 {
                model.cards[index].offset = -width
                model.swipedCard += 1
            }
            else {
                model.cards[index].offset = 0
            }
        }
    }
    
    // Getting Rotation When Card is being Swiped
    func getCardRotation(index: Int) -> Double {
        let boxWidth = Double(width / 3)
        let offset = Double(model.cards[index].offset)
        let angle: Double = 5
        return (offset / boxWidth) * angle
    }
    
    // Getting Width And Height For Card
    func getCardHeight(index: Int) -> CGFloat {
        let height: CGFloat = 400
        /// Again First Three Cards
        let cardHeight = index - model.swipedCard <= 2 ? CGFloat(index - model.swipedCard) * 35 : 70
        return height - cardHeight
    }
    
    // Get Card Width
    func getCardWidth(index: Int) -> CGFloat {
        let boxWidth = UIScreen.main.bounds.width - 60 - 60
        /// For First Three Cards
        // let cardWidth = index <= 2 ? CGFloat(index) * 30 : 60
        return boxWidth
    }
    
    // Getting Offset
    func getCardOffset(index: Int) -> CGFloat {
        return index - model.swipedCard <= 2 ? CGFloat(index - model.swipedCard) * 30 : 60
    }
}

#if DEBUG
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
#endif
