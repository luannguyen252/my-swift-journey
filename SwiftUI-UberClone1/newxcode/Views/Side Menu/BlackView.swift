//
//  BlackView.swift
//  newxcode
//
//  Created by Sergey Sevriugin on 11/09/20.
//

import SwiftUI

struct BlackView: View {
    @EnvironmentObject var userData: UserData
    var body: some View {
        VStack(alignment: .leading) {
            Button(action: {
                userData.showSideMenu.toggle()
            }) {
                Text("")
                    .frame(minWidth: 0, maxWidth: userData.showSideMenu ? 120 : 0, minHeight: 0, maxHeight: .infinity)
                    .background(Color(.sRGB, red: 0, green: 0, blue: 0, opacity: userData.showSideMenu ? 0.6 : 0))
                    .animation(.easeInOut)
            }
            
        }
        .padding(.leading, -8)
        .edgesIgnoringSafeArea(.all)
    }
}


struct BlackView_Previews: PreviewProvider {
    static var previews: some View {
        BlackView().environmentObject(UserData())
    }
}
