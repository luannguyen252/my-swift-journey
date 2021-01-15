//
//  MenuRow.swift
//  DesignCode
//
//  Created by Brian Sipple on 9/22/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import SwiftUI

struct MenuRow: View {
    var menuItem: MenuItem
    
    var body: some View {
        HStack {
            Image(systemName: self.menuItem.imageName)
                .imageScale(.large)
                .foregroundColor(Color("icons"))
                .frame(width: 32, height: 32)
            
            Text(self.menuItem.title)
                .font(.headline)
        }
    }
}


struct MenuRow_Previews: PreviewProvider {
    static var previews: some View {
        MenuRow(
            menuItem: MenuItem(title: "Menu Item", imageName: "person.circle")
        )
    }
}
