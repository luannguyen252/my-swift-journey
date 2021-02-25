//
//  MainView.swift
//  Instagram_DM_Swipe (iOS)
//
//  Created by Balaji on 06/02/21.
//

import SwiftUI

// See Scrollable Tab Bar Video...
// Link IN Description...

struct MainView: View {
    
    @State var offset: CGFloat = rect.width
    
    var body: some View {
        
        // Scrollable Tabs....
        
        GeometryReader{reader in
            
            let frame = reader.frame(in: .global)
            // Since There are Three Views...
            
            ScrollableTabBar(tabs: ["","",""], rect: frame, offset: $offset) {
                
                PostView(offset: $offset)
                
                Home(offset: $offset)
                
                DirectView(offset: $offset)
            }
            .ignoresSafeArea()
        }
        .ignoresSafeArea()
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
