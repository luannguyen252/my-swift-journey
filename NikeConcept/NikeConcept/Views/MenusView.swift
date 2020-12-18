//
//  MenusView.swift
//  NikeConcept
//
//  Created by Luan Nguyen on 18/12/2020.
//

import SwiftUI

struct MenusView: View {
    // MARK: - PROPERTIES
    @ObservedObject var menuSelector: MenuSelector

    // MARK: - BODY
    var body: some View {
        HStack {
            ForEach(menuSelector.menus) { menu in
                MenuItemView(menu: menu)
                    .padding()
                    .onTapGesture {
                        withAnimation { menuSelector.selectMenu(menu: menu) }
                    }
            }
        } //: HSTACK
    }
}

// MARK: - MENU ITEM VIEW
struct MenuItemView: View {
    // MARK: - PROPERTIES
    let menu: MenuItem

    // MARK: - BODY
    var body: some View {
        VStack(spacing: 4) {
            Text(menu.name)
            
            RoundedRectangle(cornerRadius: 1)
                .frame(height: 2)
                .opacity(menu.selected ? 1.0 : 0.0)
        } //: VSTACK
        .foregroundColor(menu.selected ? .orange : .gray)
        .fixedSize()
    }
}
