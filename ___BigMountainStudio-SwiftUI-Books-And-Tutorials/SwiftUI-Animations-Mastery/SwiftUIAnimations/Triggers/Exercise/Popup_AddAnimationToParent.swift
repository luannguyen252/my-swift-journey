//
//  Popup_AddAnimationToParent.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 11/10/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Popup_AddAnimationToParent: View {
    @State private var showPopup = true
    @GestureState private var popupOffset = CGSize.zero
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                TitleText("Triggers")
                SubtitleText("Show Popup")
                BannerText("The parent view animates the hiding and showing of its child views.", backColor: .yellow)
                
                Spacer()
                
                Button("Show Popup") {
                    self.showPopup = true
                }
            }
            .font(.title)
            .blur(radius: showPopup ? 2 : 0)
                .animation(.easeOut)
            
            if showPopup {
                ZStack {
                    Color.black
                        .opacity(0.4)
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture { self.showPopup = false }
                    
                    VStack(spacing: 20) {
                        Text("Drag popup off the screen")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.yellow)
                        Spacer()
                        Text("You can also tap outside of the popup to close")
                        Spacer()
                        Button("Or Tap This Button to Close") {
                            self.showPopup = false
                        }.padding(.bottom)
                    }
                    .frame(height: 300)
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(radius: 20)
                    .padding(.horizontal, 25)
                    .offset(popupOffset)
                    .gesture(
                        DragGesture(minimumDistance: 100)
                            .updating($popupOffset, body: { (value, popupOffset, transaction) in
                                popupOffset = value.translation
                            })
                            .onEnded({ value in
                                self.showPopup = false
                            }))
                }.animation(.default)
            }
        }.animation(.easeIn) // This animation will be used to hide/show the popup
    }
}

struct Popup_AddAnimationToParent_Previews: PreviewProvider {
    static var previews: some View {
        Popup_AddAnimationToParent()
    }
}
