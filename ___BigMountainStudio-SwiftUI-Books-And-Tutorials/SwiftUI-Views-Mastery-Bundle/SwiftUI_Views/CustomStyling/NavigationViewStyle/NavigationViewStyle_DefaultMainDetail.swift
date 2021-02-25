//
//  NavigationViewStyle_DefaultMasterDetail.swift
//  100Views
//
//  Created by Mark Moeykens on 9/19/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct NavigationViewStyle_DefaultWithSecondView: View {
    var body: some View {
        NavigationView {
            // 1. Main View
            VStack(spacing: 25) {
                Image(systemName: "globe").font(.largeTitle)
                
                HeaderView("",
                           subtitle: "Show Second Screen",
                           desc: "Here is the default style and behavior when a second view is defined.",
                           back: Color.orange)
                
                NavigationLink(destination: ProfileDetail()) {
                    Text("Navigate to Detail")
                }
                
                Spacer()
            }
            .font(.title)
            .padding(.top, 25)
            .navigationTitle("Navigation View Style")
            .background(Color("Theme3BackgroundColor"))
            .ignoresSafeArea(edges: .bottom)
            
            
            // 2. Define a second view to be shown
            ProfileDetail()
        }
        // You don't have to set the default style here
        .navigationViewStyle(DefaultNavigationViewStyle())
    }
}

struct NavigationViewStyle_DefaultWithSecondView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationViewStyle_DefaultWithSecondView()
            .previewDevice("iPad Pro (9.7-inch)")
    }
}
