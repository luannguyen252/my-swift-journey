//
//  Home.swift
//  Animated_Tab_Bar (iOS)
//
//  Created by Balaji on 04/03/21.
//

import SwiftUI

struct Home: View {
    @State var selectedTab = "house"
    var body: some View {
        
        ZStack(alignment: .bottom, content: {
            
            Color("TabBG")
                .ignoresSafeArea()
            
            // Custom Tab Bar....
            
            CustomTabBar(selectedTab: $selectedTab)
        })
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
