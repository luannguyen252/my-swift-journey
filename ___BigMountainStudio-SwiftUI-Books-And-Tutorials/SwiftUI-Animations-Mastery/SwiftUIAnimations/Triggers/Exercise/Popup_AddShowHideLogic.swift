//
//  Popup_AddShowHideLogic.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 11/10/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Popup_AddShowHideLogic: View {
    @State private var showPopup = true // Controls if the popup shows or not
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                TitleText("Triggers")
                SubtitleText("Show Popup")
                BannerText("Add a state variable to control the logic of showing/hiding the popup.", backColor: .yellow)
                
                Spacer()
                
                Button("Show Popup") {
                    // Show popup
                    self.showPopup = true
                }
            }.font(.title)
            // Blur the background when popup is showing
            .blur(radius: showPopup ? 2 : 0)
            
            // Put the Popup inside an if
            if showPopup {
                ZStack {
                    Color.black
                        .opacity(0.4)
                        .edgesIgnoringSafeArea(.all)
                        // Dismiss popup
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
                            // Dismiss popup
                            self.showPopup = false
                        }.padding(.bottom)
                    }
                    .frame(height: 300)
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(radius: 20)
                    .padding(.horizontal, 25)
                }
            }
        }
    }
}

struct Popup_AddShowHideLogic_Previews: PreviewProvider {
    static var previews: some View {
        Popup_AddShowHideLogic()
    }
}
