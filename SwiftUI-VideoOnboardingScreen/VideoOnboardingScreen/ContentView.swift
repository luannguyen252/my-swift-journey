//
//  ContentView.swift
//  VideoOnboardingScreen
//
//  Created by Luan Nguyen on 17/12/2020.
//

import SwiftUI

struct ContentView: View {
    // MARK: - BODY
    var body: some View {
        ZStack {
            PlayerView()
                .overlay(Color.green.opacity(0.4))
                .blur(radius: 1)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                Image(systemName: "paperplane.fill")
                    .resizable()
                    .frame(width: 70, height: 70)
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.white)
                    .padding(.bottom, 30)
                Text("Explore the World")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                Text("Discover the most amazing places in the world and share your experience with the No. 1 travel community.")
                    .foregroundColor(.white)
                    .frame(maxWidth: 320)
                    .padding(.top, 20)
                    .padding(.bottom, 50)
                Spacer()
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.white)
                HStack {
                    Spacer()
                    Text("Login")
                        .foregroundColor(.white)
                        .padding(20)
                    Spacer()
                    Text("Signup")
                        .foregroundColor(.white)
                        .padding(20)
                    Spacer()
                } //: HSTACK
            } //: VSTACK
        } //: ZSTACK
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
