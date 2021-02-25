//
//  Navigation_2_00.swift
//  100Views
//
//  Created by Mark Moeykens on 6/19/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Navigation_NavBarItems : View {
    var body: some View {
        NavigationView {
            VStack(spacing: 25) {
                Image(systemName: "globe").font(.largeTitle)
                
                HeaderView("NavigationView",
                           subtitle: "Navigation Bar Items",
                           desc: "You can add navigation bar buttons to the leading or trailing (or both) sides of a navigation bar.",
                           back: Color("Theme3ForegroundColor"),
                           textColor: Color("Theme3BackgroundColor"))
                
                Spacer()
            }
            .font(.title)
            .padding(.top, 25)
            .navigationTitle("Navigation Bar Buttons")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {}) {
                        Image(systemName: "bell.fill")
                            .padding(.horizontal)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Actions", action: { })
                }
            }
        }
        .accentColor(.pink)
    }
}

struct Navigation_NavBarItems_Previews : PreviewProvider {
    static var previews: some View {
        Navigation_NavBarItems()
    }
}
