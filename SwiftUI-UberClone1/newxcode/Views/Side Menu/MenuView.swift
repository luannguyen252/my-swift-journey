//
//  MenuView.swift
//  newxcode
//
//  Created by Sergey Sevriugin on 11/09/20.
//

import SwiftUI

import NavigationStack

struct MenuView: View {
    @EnvironmentObject var userData: UserData
    
    private let menuRouter = MenuRouter()
    
    func linkBuilder<Content: View>(for item: MenuItem, @ViewBuilder content: () -> Content) -> some View {
        
        PushView(destination: menuRouter.makeView(for: item)) {
            content()
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            ForEach(0..<K.menuItems.count, id:\.self) { i in
                linkBuilder(for: K.menuItems[i]) {
                    MenuItemView(item: userData.showSideMenu ? K.menuItems[i] : MenuItem(title: "?",iconSystemName: "gear"))
                }
            }
            Spacer()
            
        }.frame(minWidth: 0, maxWidth: userData.offset, minHeight: 0, maxHeight: .infinity).background(Color.white).edgesIgnoringSafeArea(.all).statusBar(hidden: userData.showSideMenu).animation(.easeInOut)
    }
    
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView().environmentObject(UserData())
    }
}
