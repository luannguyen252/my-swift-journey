//
//  Navigation_CustomBackButton.swift
//  100Views
//
//  Created by Mark Moeykens on 9/21/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Navigation_CustomBackButton: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color("Theme3BackgroundColor")
                VStack(spacing: 25) {
                    Image(systemName: "globe").font(.largeTitle)
                    Text("NavigationView").font(.largeTitle)
                    Text("Custom Back Button").foregroundColor(.gray)
                    Image("NavBarBackButtonHidden")
                    
                    NavigationLink("Go To Detail",
                                   destination: Navigation_CustomBackButton_Detail())
                    Spacer()
                }
                .font(.title)
                .padding(.top, 70)
            }
            .navigationTitle("Navigation Views")
            .ignoresSafeArea(edges: .bottom)
        }
    }
}
// Second Screen
struct Navigation_CustomBackButton_Detail: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color("Theme3BackgroundColor")
            VStack(spacing: 25) {
                Image(systemName: "globe").font(.largeTitle)
                HeaderView("NavigationView",
                           subtitle: "Custom Back Button",
                           desc: "Hide the system back button and then use toolbar modifier to add a leading button.",
                           back: Color("Theme3ForegroundColor"),
                           textColor: Color("Theme3BackgroundColor"))
                Image("NavBarBackButtonHidden")
                Spacer()
            }
            .font(.title)
            .padding(.top, 50)
        }
        .navigationTitle("Detail View")
        .navigationBarTitleDisplayMode(.inline)
        .ignoresSafeArea(edges: .bottom)
        // Hide the system back button
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigation) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "arrow.left.circle")
                }
            }
        }
    }
}

struct Navigation_CustomBackButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Navigation_CustomBackButton()
            Navigation_CustomBackButton_Detail()
        }
    }
}
