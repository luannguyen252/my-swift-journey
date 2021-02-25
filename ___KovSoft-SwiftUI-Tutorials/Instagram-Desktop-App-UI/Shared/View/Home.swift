//
//  Home.swift
//  Instagram Desktop (iOS)
//
//  Created by Balaji on 23/12/20.
//

import SwiftUI

// Gradient....
let gradient = LinearGradient(gradient: .init(colors: [Color("gradient1"),Color("gradient2")]), startPoint: .leading, endPoint: .trailing)

struct Home: View {
    
    var screen = NSScreen.main!.visibleFrame
    
    var body: some View {
        
        HStack(spacing: 0){
            
            SideView()
            
            MainView()
        }
        .ignoresSafeArea(.all, edges: .all)
        .frame(width: screen.width / 1.4, height: screen.height - 60)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
