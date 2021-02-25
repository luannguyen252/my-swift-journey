//
//  Navigation_DisplayMode.swift
//  100Views
//
//  Created by Mark Moeykens on 7/20/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Navigation_DisplayMode: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color("Theme3BackgroundColor")
                VStack(spacing: 25) {
                    Image(systemName: "globe")
                        .font(.largeTitle)
                    
                    HeaderView("NavigationView",
                               subtitle: "Display Mode",
                               desc: "For the navigation bar display mode, you can specify if you want it large or small (inline) or just automatic.",
                               back: Color("Theme3ForegroundColor"),
                               textColor: Color("Theme3BackgroundColor"))
                    
                    Spacer()
                }
                .font(.title)
                .padding(.top, 25)
            }
            .navigationTitle("Navigation Views")
            // Use .inline for the smaller nav bar
            .navigationBarTitleDisplayMode(.inline)
            .ignoresSafeArea(edges: .bottom)
        }
    }
}

struct Navigation_DisplayMode_Previews: PreviewProvider {
    static var previews: some View {
        Navigation_DisplayMode()
    }
}
