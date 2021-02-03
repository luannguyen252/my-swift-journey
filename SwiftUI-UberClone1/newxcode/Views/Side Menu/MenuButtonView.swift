//
//  MenuButtonView.swift
//  newxcode
//
//  Created by Sergey Sevriugin on 11/09/20.
//

import SwiftUI

struct MenuButtonView: View {
    @EnvironmentObject var userData: UserData
    var body: some View {
        Button(action: {
            print("DEBUG: MenuButtonView.action: is pressed")
            userData.showSideMenu.toggle()
        }) {
            Image(systemName: "line.horizontal.3")
                .renderingMode(.original)
                .resizable()
                .frame(width: 32, height: 24, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
        }
        .padding(.leading, 20)
        .padding(.top, userData.showSideMenu ? 28 : 0)
        .position(x: 20 + userData.offset, y: 20).animation(.easeInOut)
        
    }
}

struct MenuButtonView_Previews: PreviewProvider {
    static var previews: some View {
        MenuButtonView().environmentObject(UserData()).previewLayout(.fixed(width: 60, height: 60))
    }
}
