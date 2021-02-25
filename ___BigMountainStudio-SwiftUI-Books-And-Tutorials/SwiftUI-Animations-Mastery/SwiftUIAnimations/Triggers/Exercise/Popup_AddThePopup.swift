//
//  Popup_AddThePopup.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 11/9/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Popup_AddThePopup: View {
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                TitleText("Triggers")
                SubtitleText("Show Popup")
                BannerText("The popup will also be another ZStack because we want a dark transparent background to it.", backColor: .yellow)
                Spacer()
                Button("Show Popup") {
                    // Show popup
                }
            }.font(.title)
            
            // The popup
            ZStack {
                // Background transparent color
                Color.black
                    .opacity(0.4)
                    .edgesIgnoringSafeArea(.all)
                
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

struct Popup_AddThePopup_Previews: PreviewProvider {
    static var previews: some View {
        Popup_AddThePopup()
    }
}
