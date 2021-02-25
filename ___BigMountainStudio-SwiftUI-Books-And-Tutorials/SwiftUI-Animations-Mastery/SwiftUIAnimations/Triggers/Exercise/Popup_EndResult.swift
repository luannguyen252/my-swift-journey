//
//  Popup_EndResult.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 11/9/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Popup_EndResult: View {
    @State private var showPopup = true
    @GestureState private var popupOffset = CGSize.zero
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                TitleText("Triggers")
                SubtitleText("Show Popup")
                BannerText("The popup will animate when shown and animate will disappears.", backColor: .yellow)
                
                Spacer()
                
                Button("Show Popup") {
                    self.showPopup = true
                }
            }
            .blur(radius: showPopup ? 2 : 0) // Blur the background when popup is showing
            .font(.title)
            .animation(.easeOut)
            
            if showPopup {
                // The popup
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
                        DragGesture(minimumDistance: 100) // They have to drag it over 100 points
                            .updating($popupOffset, body: { (value, popupOffset, transaction) in
                                popupOffset = value.translation
                            })
                            .onEnded({ value in
                                // If they dragged the popup over 100 points then just close the popup
                                self.showPopup = false
                            }))
                }.animation(.default)
            }
        }.animation(.easeIn)
    }
}

struct Popup_EndResult_Previews: PreviewProvider {
    static var previews: some View {
        Popup_EndResult()
    }
}
