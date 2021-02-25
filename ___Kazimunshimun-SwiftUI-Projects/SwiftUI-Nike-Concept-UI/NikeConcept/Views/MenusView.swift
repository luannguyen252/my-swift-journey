//
//  MenusView.swift
//  NikeConcept
//
//  Created by Anik on 6/11/20.
//

import SwiftUI

struct MenusView: View {
    @ObservedObject var menuSelector: MenuSelector
    var body: some View {
        HStack {
            ForEach(menuSelector.menus) { menu in
                MenuItemView(menu: menu)
                    .padding()
                    .onTapGesture {
                        withAnimation { menuSelector.selectMenu(menu: menu) }
                    }
            }
        }
    }
}

struct MenuItemView: View {
    let menu: MenuItem
    var body: some View {
        VStack(spacing: 4) {
            Text(menu.name)
            
            RoundedRectangle(cornerRadius: 1)
                .frame(height: 2)
                .opacity(menu.selected ? 1.0 : 0.0)
        }
        .foregroundColor(menu.selected ? .orange : .gray)
        .fixedSize()
    }
}
