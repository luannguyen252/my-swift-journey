//  Created by Mark Moeykens on 6/26/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.

import SwiftUI

struct TabView_Colors : View {
    var body: some View {
        TabView {
            // Tab 1
            VStack(spacing: 20) {
                Text("TabView")
                    .font(.largeTitle)
                Text("Tab Item Colors")
                    .font(.title).foregroundColor(.gray)
                Text("Set the color of the active tab item by setting the accent color for the TabView.")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.yellow)
                    .foregroundColor(Color.black)
                    .font(.title)
                Image("AccentColor")
            }.tabItem {
                Image(systemName: "star.fill")
            }
            // Tab 2
            Text("Second Screen").tabItem {
                Image(systemName: "moon.fill")
            }
            .foregroundColor(Color.red)
            // Tab 3
            Text("Third Screen").tabItem {
                Image(systemName: "sun.min.fill")
            }
        }
        .accentColor(.yellow)
    }
}

struct TabView_Colors_Previews : PreviewProvider {
    static var previews: some View {
        TabView_Colors()
    }
}
