//
//  SettingsMenu.swift
//  DesignCode
//
//  Created by Brian Sipple on 9/22/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import SwiftUI

struct SidebarMenu: View {
    @EnvironmentObject var menuStore: MenuStore
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
  
            ForEach(menuStore.menuItems) { item in
                MenuRow(menuItem: item)
            }
            
            Spacer()
        }
    }
}


struct SettingsMenu_Previews: PreviewProvider {
    static var previews: some View {
        SidebarMenu()
            .environmentObject(MenuStore())
    }
}


