//
//  MenuListView.swift
//  SwiftUIVPNApp2
//
//  Created by Luan Nguyen on 27/12/2020.
//

import SwiftUI

struct MenuListView: View {
    var body: some View {
        ForEach(Data.menus) { menu in
            MenuItemView(menu: menu)
                .padding(.vertical, 16)
        }
    }
}

struct MenuListView_Previews: PreviewProvider {
    static var previews: some View {
        MenuListView()
    }
}
