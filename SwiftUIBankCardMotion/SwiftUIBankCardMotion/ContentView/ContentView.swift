//
//  ContentView.swift
//  SwiftUIBankCardMotion
//
//  Created by Luan Nguyen on 27/12/2020.
//

import SwiftUI
import Combine

struct ContentView: View {
    @State var isCardTapped: Bool = false
    @State var scrollingDisabled = false
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack(spacing: 0) {
            // Profile
            Button {
                print("Button Pressed!")
            } label: {
                VStack(spacing: 8) {
                    Image(uiImage: #imageLiteral(resourceName: "profile"))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 32, height: 32)
                        .cornerRadius(32)
                    
                    Text("Hello, Luan Nguyen")
                        .font(.system(size: 16))
                        .fontWeight(.regular)
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                }
            }

            
            ZStack {
                // Bank Cards
                HStack(spacing: 16) {
                    ForEach(cardData) { item in
                        GeometryReader { geometry in
                            VStack {
                                CardBalance(isCardTapped: self.$isCardTapped, cardData: item)
                                Card(isCardTapped: self.$isCardTapped, card: item)
                                    .rotation3DEffect(Angle(degrees: self.isCardTapped ? 0 : Double(geometry.frame(in: .global).minX - 20) / 30), axis: (x: 15, y: -20, z: 0))
                                    }
                            .padding(.horizontal, 16)
                            .offset(y: -130)
                        }
                        .frame(width: 375, height: 400)
                    }
                }
                .frame(maxHeight: .infinity)
                .modifier(ScrollingHStackModifier(items: cardData.count, itemWidth: 300, itemSpacing: 95))

                // Add Bank Card
                AddBankCard()
                
                // Payment History
                PaymentHistory()
                    .offset(y: isCardTapped ? 210 : 690)
                    .animation(.easeInOut(duration: 0.25))
                    .padding(.bottom, 40)

            }
            .onTapGesture {
                self.isCardTapped = false
            }
            .frame(maxWidth: .infinity)
            .frame(maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
