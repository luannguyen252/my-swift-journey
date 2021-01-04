//
//  TabBar.swift
//  SwiftUIGeometryReader
//
//  Created by Luan Nguyen on 04/01/2021.
//

import SwiftUI

struct TabBar: View {
    // MARK: - BODY
    var body: some View {
        TabView {
            CardView().tabItem ({
                Image(systemName: "gamecontroller.fill")
                    .font(.system(size: 30))
                Text("Layout")
            })
            
            ContentView().tabItem ({
                Image(systemName: "gamecontroller.fill")
                    .font(.system(size: 25))
                Text("Animation")
            })
        }
    }
}

// MARK: - PREVIEW
#if DEBUG
struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
#endif
