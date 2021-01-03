//
//  3DCardView.swift
//  SwiftUIBankCardAnimation2
//
//  Created by Luan Nguyen on 03/01/2021.
//

import SwiftUI

struct Card3DView: View {
    // MARK: - CONSTANTS
    let transparencyAngle = 50.0
    let card3DRotationAngle: Double = 14
    
    // MARK: - PROPERTIES
    private let cards: [Card]
    
    /// Visible card index
    @State private var currentIndex = 0
    private var nextIndex: Int { return (currentIndex + 1) % cards.count }
    private var prevIndex: Int { return (currentIndex + cards.count - 1) % cards.count }
    
    /// Card selection rotation angle
    @State private var angle: Angle = .zero
    
    /// Card selection rotation anchor
    private let cardsRotationAnchor = UnitPoint(x: 1.5, y: 0.5)
    
    @State private var showCardMenu = false
    
    @State private var indexView = IndexView()
    
    @State private var menuItemSize: CGFloat = 66

    
    // MARK: - HELPER
    private func angle(forWidth width: CGFloat, offset: CGSize) -> Angle {
        return Angle(radians:
            Double(-atan(offset.height/(width*cardsRotationAnchor.x-width/2)))
        )
    }
    
    init(cards: [Card]) {
        self.cards = cards
    }
    
    // MARK: - BODY
    var body: some View {
        var visibleCard = CardView(card: self.cards[self.currentIndex])
        visibleCard.flarePosition = showCardMenu ?
            UnitPoint(x: 1.0, y: 0.5) : UnitPoint(x: 0.3, y: 0.2)
        
        return
            GeometryReader { geometry in
                // Screen backgound color
                Color(UIColor(named: "backgroundColor")!)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Button(action: {
                        print("Go to profile page.")
                    }, label: {
                        VStack(spacing: 8) {
                            Image(uiImage: #imageLiteral(resourceName: "profile"))
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 56, height: 56)
                                .cornerRadius(28)
                            
                            Text("Nguyen Thanh Luan")
                                .foregroundColor(.white)
                                .font(.system(size: 18))
                                .fontWeight(.regular)
                        } //: VSTACK
                    })
                    .padding(.top, 40)
                    
                    Spacer()
                    
                    ZStack(alignment: .leading) {
                        // Selected card index view
                        self.indexView
                            .onAppear {
                                self.indexView = self.indexView
                                    .select(at: self.currentIndex,
                                            in: self.cards.count)
                        }
                        
                        HStack(alignment: .center, spacing: 0) {
                            Spacer()
                            
                            // Cards container
                            ZStack {
                                CardView(card: self.cards[self.nextIndex])
                                    // Next card is at 90 degrees
                                    // Opacity depends on the angle
                                    .opacity(1-abs(self.angle.degrees+90) / self.transparencyAngle)
                                    .rotationEffect(Angle(degrees: self.angle.degrees+90),
                                                    anchor: self.cardsRotationAnchor)
                                
                                visibleCard
                                    // Visible card is at 0 degrees
                                    // Opacity depends on the angle
                                    .opacity(1-abs(self.angle.degrees)/self.transparencyAngle)
                                    .rotationEffect(self.angle,
                                                    anchor: self.cardsRotationAnchor)
                                
                                CardView(card: self.cards[self.prevIndex])
                                    // Previous card is at -90 degrees
                                    // Opacity depends on the angle
                                    .opacity(1-abs(self.angle.degrees-90)/self.transparencyAngle)
                                    .rotationEffect(Angle(degrees: self.angle.degrees-90),
                                                    anchor: self.cardsRotationAnchor)
                            } //: ZSTACK
                            .padding(.horizontal, 18)
                                // 3D rotation effect based on showCardMenu prop
                                .rotation3DEffect(.degrees(self.showCardMenu ? self.card3DRotationAngle : 0),
                                                  axis: (x: 0, y: -1, z: 0),
                                                  anchor: .trailing,
                                                  perspective: 1)
                                .padding(.leading, self.showCardMenu ? -self.menuItemSize : 0)
                                // Cards selection rotation gesture
                                .gesture(DragGesture()
                                    .onChanged {
                                        // hide menu if needed
                                        if self.showCardMenu {
                                            withAnimation(.easeInOut(duration: 0.2)) {
                                                self.showCardMenu = false
                                            }
                                        }
                                        
                                        self.angle =
                                            self.angle(forWidth: geometry.size.width,
                                                       offset: $0.translation)
                                }
                                .onEnded { _ in
                                    self.updateCardSelection(for: self.angle)
                                })
                                // Show menu tap gesture
                                .gesture(TapGesture().onEnded {
                                    withAnimation(.easeInOut(duration: 0.2)) {
                                        self.showCardMenu.toggle()
                                    }
                                })
                                // Getting height to calculate menu item size. hack :)
                                .overlay(GeometryReader { g in
                                    Color.clear.onAppear {
                                        self.menuItemSize = g.size.height / 3
                                    }
                                })
                            
                            // Card menu
                            if self.showCardMenu {
                                CardMenu(size: self.menuItemSize)
                                    .transition(AnyTransition
                                        .move(edge: .trailing)
                                        .combined(with: .opacity))
                            }
                            
                            Spacer()
                        } //: HSTACK
                    } //: ZSTACK
                } //: VSTACK
                .padding(.bottom, 80)
        } //: GEOMETRY READER
    }
    
    // MARK: - ACTIONS
    private func updateCardSelection(for angle: Angle) {
        let duration = TimeInterval(0.45)
        var newIndex = currentIndex
        
        withAnimation(.easeOut(duration: duration)) {
            switch self.angle.degrees {
            case 15...:
                // Show previous card
                newIndex = self.prevIndex
                self.angle.degrees = 90
                
            case  ...(-15):
                // Show next card
                newIndex = self.nextIndex
                self.angle.degrees = -90

            default:
                self.angle = .zero
            }
            
            self.indexView =
                self.indexView.select(at: newIndex, in: self.cards.count)

        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            self.currentIndex = newIndex
            self.angle = .zero
        }
    }
}

// MARK: - PREVIEW
#if DEBUG
struct Card3DView_Previews: PreviewProvider {
    static var previews: some View {
        Card3DView(cards: TestData.cards)
    }
}
#endif
