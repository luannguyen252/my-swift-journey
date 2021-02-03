//
//  MenuRouter.swift
//  newxcode
//
//  Created by Sergey Sevriugin on 12/09/20.
//

import SwiftUI

class MenuRouter {
   
    func makeView(for item: MenuItem) -> some View {
        return ZStack(alignment: .top) {
                
            Text(item.title).frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: .infinity, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: .infinity, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).background(Color.white)
            
            NavigationHeaderView(title: item.title)
        }.statusBar(style: .lightContent)
    }
}


