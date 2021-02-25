//
//  Navigation_BarHidden.swift
//  100Views
//
//  Created by Mark Moeykens on 9/21/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Navigation_BarHidden: View {
    @State private var isHidden = true
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("Theme3BackgroundColor")
                VStack(spacing: 25) {
                    Image(systemName: "globe").font(.largeTitle)
                    
                    HeaderView("NavigationView",
                               subtitle: "Navigation Bar Hidden",
                               desc: "If you don't want to show a navigation bar, you can use the navigationBarHidden modifier to hide it.",
                               back: Color("Theme3ForegroundColor"),
                               textColor: Color("Theme3BackgroundColor"))
                    
                    Toggle("Hide Nav Bar", isOn: $isHidden)
                        .padding()
                    
                    Spacer()
                }
                .font(.title)
                .padding(.top, 70)
            }
            // Hide when the Toggle is on
            .navigationBarHidden(isHidden)
            .ignoresSafeArea(edges: .bottom)
        }
    }
}

struct Navigation_BarHidden_Previews: PreviewProvider {
    static var previews: some View {
        Navigation_BarHidden()
    }
}
