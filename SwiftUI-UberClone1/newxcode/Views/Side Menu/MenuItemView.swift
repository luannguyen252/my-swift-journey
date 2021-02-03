//
//  SwiftUIView.swift
//  newxcode
//
//  Created by Sergey Sevriugin on 11/09/20.
//

import SwiftUI

struct MenuItem {
    var title: String
    var iconSystemName: String
}

struct MenuItemView: View {
    var item: MenuItem
    var body: some View {
        HStack {
            Image(systemName: item.iconSystemName).resizable().frame(width: 20, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Text(item.title).frame(width: 200, height: 60, alignment: .leading)
        }
    }
}


struct MenuItem_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemView(item: MenuItem(title: "Settings", iconSystemName: "gear")) .previewLayout(.fixed(width: 300, height: 70))
    }
}
