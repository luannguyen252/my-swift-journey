//
//  CertificateDetailView.swift
//  DesignCode
//
//  Created by Brian Sipple on 9/21/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import SwiftUI

struct CertificateDetailView: View {
    @Binding var certificate: Certificate

    var cardSize = CertificateCard.defaultCardSize
    
    @State private var isCardTwisted = false
    @State private var cardDragOffset: CGSize = .zero
    
    
    var cardTwistFactor: Double { isCardTwisted ? 1 : 0 }
    
    var body: some View {
        ZStack {
            BlurEffectView(blurStyle: .systemUltraThinMaterial)
            
            VStack {
                Image("Illustration5")
                Spacer()
            }
                .padding()
                .blur(radius: 6 * CGFloat(cardTwistFactor))
                .animation(.easeOut)
            
            RearCardView(size: cardSize)
                .background(isCardTwisted ? Color("background5") : Color("background6"))
                .cornerRadius(18)
                .shadow(radius: 10)
                .offset(x: 0, y: -40 - (400 * CGFloat(cardTwistFactor)))
                .scaleEffect(0.85)
                .rotationEffect(.radians(.pi / 6) * cardTwistFactor)
                .rotation3DEffect(.radians(.pi / 3) * cardTwistFactor, axis: (x: 10, y: 10, z: 10))
                .blendMode(.hardLight)
                .animation(.interpolatingSpring(mass: 0.76, stiffness: 67, damping: 23, initialVelocity: 9))
                .offset(x: cardDragOffset.width, y: cardDragOffset.height)

            RearCardView(size: cardSize)
                .background(isCardTwisted ? Color("background10") : Color("background7"))
                .cornerRadius(18)
                .shadow(radius: 10)
                .offset(x: 0, y: -20 - (200 * CGFloat(cardTwistFactor)))
                .scaleEffect(0.9)
                .rotationEffect(.radians(.pi / 12) * cardTwistFactor)
                .rotation3DEffect(.radians(.pi / 4.5) * cardTwistFactor, axis: (x: 10, y: 10, z: 10))
                .blendMode(.hardLight)
                .animation(.interpolatingSpring(mass: 0.76, stiffness: 67, damping: 23, initialVelocity: 12))
                .offset(x: cardDragOffset.width, y: cardDragOffset.height)
            
            
            CertificateCard(certificate: $certificate)
                .frame(width: cardSize.width, height: cardSize.height)
                .offset(x: cardDragOffset.width, y: cardDragOffset.height)
                .scaleEffect(0.95)
                .rotationEffect(.radians(.pi / 24) * cardTwistFactor)
                .rotation3DEffect(.radians(.pi / 6) * cardTwistFactor, axis: (x: 10, y: 10, z: 10))
                .animation(.interpolatingSpring(mass: 0.76, stiffness: 67, damping: 23, initialVelocity: 19))
                .onTapGesture {
                    self.isCardTwisted.toggle()
                }
                .gesture(
                    DragGesture()
                        .onChanged { dragValue in
//                            self.isCardTwisted = true
                            self.cardDragOffset = dragValue.translation
                        }
                        .onEnded { _ in
//                            self.isCardTwisted = false
                            self.cardDragOffset = .zero
                        }
                )
            
            BottomModal()
                .frame(minWidth: 100, maxWidth: .infinity, minHeight: 300, maxHeight: .infinity)
                .animation(.easeOut)
        }
        .navigationBarTitle("Certificates", displayMode: .large)
    }
}


private struct RearCardView: View {
    var size: CGSize
    
    var body: some View {
        VStack {
            Text("Card Back")
        }
        .frame(width: size.width, height: size.height)
    }
}


private struct BottomModal: View {
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 20) {
                Rectangle()
                    .frame(width: 60, height: 6)
                    .cornerRadius(3)
                    .opacity(0.12)
                
                Text("This certificate means you're awesome 🙌!")
                    .lineLimit(10)
                
                Spacer()
            }
            .edgesIgnoringSafeArea(.bottom)
            .padding()
            .padding(.horizontal)
            .background(BlurEffectView(blurStyle: .systemThinMaterial))
            .cornerRadius(20)
            .shadow(radius: 20)
            .edgesIgnoringSafeArea(.bottom)
            .offset(x: 0, y: geometry.size.height * 0.8)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CertificateDetailView(certificate: .constant(CertificatesStore.defaultCertificates[0]))
            .environment(\.colorScheme, .dark)
    }
}
