//
//  TabBarView.swift
//  SwiftUI-Gallery
//
//  Created by Luan Nguyen on 16/01/2021.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            Tab1View()
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Tab 1")
            }

            Tab2View()
                .tabItem {
                        Image(systemName: "square.and.pencil")
                        Text("Tab 2")
                }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
