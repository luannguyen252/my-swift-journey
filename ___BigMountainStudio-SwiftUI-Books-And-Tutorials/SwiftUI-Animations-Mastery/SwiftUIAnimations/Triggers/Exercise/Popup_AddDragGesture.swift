//
//  Popup_AddDragGesture.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 11/10/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Popup_AddDragGesture: View {
    @State private var showPopup = true
    @GestureState private var popupOffset = CGSize.zero // Track the distance dragged
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                TitleText("Triggers")
                SubtitleText("Show Popup")
                BannerText("Add a state variable to control the logic of showing/hiding the popup.", backColor: .yellow)
                
                Spacer()
                
                Button("Show Popup") {
                    self.showPopup = true
                }
            }
            .font(.title)
            .blur(radius: showPopup ? 2 : 0)
            
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
                    .offset(popupOffset) // Offset (move) the popup when dragged
                    .gesture(
                        DragGesture(minimumDistance: 100) // They have to drag it over 100 points
                            .updating($popupOffset, body: { (value, popupOffset, transaction) in
                                // Assign distance traveled (translation) to popupOffset (Gesture State variable that is bound: $popupOffset)
                                popupOffset = value.translation
                            })
                            .onEnded({ value in
                                // If they dragged the popup over 100 points then just close the popup
                                self.showPopup = false
                            }))
                }
            }
        }
    }
}

struct Popup_AddDragGesture_Previews: PreviewProvider {
    static var previews: some View {
        Popup_AddDragGesture()
    }
}
