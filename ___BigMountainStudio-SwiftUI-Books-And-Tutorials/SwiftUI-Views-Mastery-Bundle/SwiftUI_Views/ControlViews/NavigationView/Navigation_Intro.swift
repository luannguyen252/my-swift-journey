//
//  Navigation_1_00.swift
//  100Views
//
//  Created by Mark Moeykens on 6/19/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Navigation_Intro : View {
    var body: some View {
        NavigationView {
            ZStack {
                Color("Theme3BackgroundColor")
                VStack(spacing: 25) {
                    Image(systemName: "globe")
                        .font(.largeTitle)

                    HeaderView("NavigationView",
                               subtitle: "Introduction",
                               desc: "Having a NavigationView will show nothing unless you also include a navigationTitle modifier.",
                               back: Color("Theme3ForegroundColor"),
                               textColor: Color("Theme3BackgroundColor"))
                    
                    Spacer()
                }
                .font(.title)
                .padding(.top, 25)
            }
            // This creates a title in your nav bar
            .navigationTitle("Navigation Views")
            .ignoresSafeArea(edges: .bottom)
        }
    }
}


struct Navigation_Intro_Previews : PreviewProvider {
    static var previews: some View {
        Navigation_Intro()
    }
}
