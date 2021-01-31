//
//  TabBar.swift
//  SwiftUIDesignCode
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct TabBar: View {
    // MARK: - BODY
    var body: some View {
        TabView {
            Home().tabItem {
                Image("IconHome")
                Text("Home")
            }
            .tag(1)
            
            ContentView().tabItem {
                Image("IconCards")
                Text("Certificates")
            }
            .tag(2)
            
            Settings().tabItem {
                Image("IconSettings")
                Text("Settings")
            }
            .tag(3)
        }
        .edgesIgnoringSafeArea(.top)
    }
}

// MARK: - PREVIEW
#if DEBUG
struct TabBar_Previews: PreviewProvider {
   static var previews: some View {
      TabBar()
        .environment(\.colorScheme, .dark)
   }
}
#endif
