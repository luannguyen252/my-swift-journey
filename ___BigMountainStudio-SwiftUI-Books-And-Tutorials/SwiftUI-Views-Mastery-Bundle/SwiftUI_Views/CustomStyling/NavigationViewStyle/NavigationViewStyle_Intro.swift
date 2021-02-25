//
//  NavigationViewStyle_Intro.swift
//  100Views
//
//  Created by Mark Moeykens on 9/12/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct NavigationViewStyle_Intro: View {
    var body: some View {
        NavigationView {
            // Main View
            VStack(spacing: 25) {
                Image(systemName: "globe").font(.largeTitle)
                Text("Introduction").font(.title).foregroundColor(.gray)
                Text("The different navigation view styles really make a difference when it comes to landscape mode and iPads where it is possible to show 2 columns. Here is the default style and behavior.")
                    .frame(maxWidth: .infinity).padding()
                    .background(Color.orange)
                    .foregroundColor(Color.black)
                    .font(.title)
                
                NavigationLink(destination: ProfileDetail()) {
                    Text("Navigate to Detail")
                }.font(.title)
                Spacer()
            }
            .padding(.top, 25)
            .navigationTitle("Navigation View Style")
            .background(Color("Theme3BackgroundColor"))
            .ignoresSafeArea(edges: .bottom)
        }
        .navigationViewStyle(DefaultNavigationViewStyle())
    }
}

struct ProfileDetail: View {
    var body: some View {
        ZStack {
            Color("Theme3BackgroundColor")
            VStack(spacing: 20) {
                Image("profile")
                Text("Profile Detail").font(.largeTitle)
            }
        }.ignoresSafeArea(.all)
    }
}

struct NavigationViewStyle_Intro_Previews: PreviewProvider {
    static var previews: some View {
        NavigationViewStyle_Intro()
            
    }
}
