//
//  ContentView.swift
//  SlideIn
//
//  Created by Sud on 6/22/19.
//  Copyright © 2019 MyCompany. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    @State var selectedColor = colorPalette[0][0]
    @State var showSideMenu = false
    
    var body: some View {
        ZStack {
            SideMenuView(selectedColor: self.$selectedColor, showSideMenu: self.$showSideMenu)
            HomeView(selectedColor: self.$selectedColor, showSideMenu: self.$showSideMenu)
        }
    }
}

struct BlankView : View {
    var body: some View {
        Color.white
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
