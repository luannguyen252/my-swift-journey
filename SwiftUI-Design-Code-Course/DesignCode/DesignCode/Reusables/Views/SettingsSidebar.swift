//
//  SettingsSidebar.swift
//  DesignCode
//
//  Created by Brian Sipple on 9/22/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import SwiftUI

struct SettingsSidebar: View {
    @Binding var isShowing: Bool
    
    var sidebarOffsetFactor: CGFloat { isShowing ? 0 : 1 }
    
    var body: some View {
        SidebarMenu()
            .environmentObject(MenuStore())
            .padding(.top, 20)
            .padding(30)
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            .background(Color.white)
            .cornerRadius(30)
            .shadow(radius: 20)
            .animation(.easeOut)
            .rotation3DEffect(
                .radians((.pi / 3) * Double(sidebarOffsetFactor)),
                axis: (x: 0, y: 1, z: 0)
            )
            .offset(x: -UIScreen.main.bounds.width * sidebarOffsetFactor)
            .onTapGesture {
                self.isShowing.toggle()
            }
    }
}

struct SettingsSidebar_Previews: PreviewProvider {
    static var previews: some View {
        SettingsSidebar(isShowing: .constant(false))
    }
}
