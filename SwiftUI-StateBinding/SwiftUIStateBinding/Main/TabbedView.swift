//
//  TabbedView.swift
//  SwiftUIStateBinding
//
//  Created by Luan Nguyen on 04/01/2021.
//

import SwiftUI

struct TabbedView: View {
    // MARK: - PROPERTIES
    @State private var selection = 0
    
    // MARK: - BODY
    var body: some View {
        TabView(selection: $selection) {
            ContentView()
                .tabItem({
                    Image(systemName: "s.square.fill")
                        .font(.largeTitle)
                    Text("State and Binding")
                }).tag(0)
            
            ScoreView()
                .tabItem({
                    Image(systemName: "o.square.fill")
                        .font(.largeTitle)
                    Text("Observed Object")
                }).tag(1)
            
            UserSettingsView()
                .tabItem({
                    Image(systemName: "e.square.fill")
                        .font(.largeTitle)
                    Text("Environment Object")
                }).tag(2)
        }
    }
}

// MARK: - PREVIEW
#if DEBUG
struct TabbedView_Previews: PreviewProvider {
    static var previews: some View {
        TabbedView()
    }
}
#endif
