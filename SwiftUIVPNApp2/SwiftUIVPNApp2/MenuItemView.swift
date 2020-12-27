//
//  MenuItemView.swift
//  SwiftUIVPNApp2
//
//  Created by Luan Nguyen on 27/12/2020.
//

import SwiftUI

struct MenuItemView: View {
    let menu: MenuItem
    
    var body: some View {
        Button {
            print("Button Pressed!")
        } label: {
            HStack(spacing: 16) {
                Image(systemName: menu.imageName)
                    .font(.title2)
                    .fixedSize(horizontal: true, vertical: true)
                    .frame(width: 32)
                
                Text(menu.name)
                    .font(.system(size: 16, weight: .bold))
            }
        }
    }
}
