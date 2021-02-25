//
//  SideTabView.swift
//  FB Mac
//
//  Created by Balaji on 15/12/20.
//

import SwiftUI

struct SideTabView: View {
    var screen = NSScreen.main!.visibleFrame
    var body: some View {
        VStack(spacing: 18){
            
            // Contact Buttons...
            
            SideTabButton(image: "logo", title: "Kavsoft", color: "", isSystem: false)
                .padding(.top,20)
            
            SideTabButton(image: "shield.checkerboard", title: "Covid 19 Info Center", color: "covid", isSystem: true)
            
            SideTabButton(image: "person.2.fill", title: "Friends", color: "friends", isSystem: true)
            
            SideTabButton(image: "messenger", title: "Messenger", color: "", isSystem: false)
            
            SideTabButton(image: "flag.fill", title: "Pages", color: "pages", isSystem: true)
            
            SideTabButton(image: "shop", title: "MarketPlace", color: "market", isSystem: false)
            
            SideTabButton(image: "play.tv", title: "Watch", color: "watch", isSystem: true)
            
            SideTabButton(image: "calender", title: "Events", color: "events", isSystem: false)
            
            Spacer()
        }
        .frame(maxWidth: (screen.width / 1.8) / 4, maxHeight: .infinity)
    }
}

struct SideTabView_Previews: PreviewProvider {
    static var previews: some View {
        SideTabView()
    }
}
