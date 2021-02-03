//
//  ContentView.swift
//  newxcode
//
//  Created by Sergey Sevriugin on 08/09/20.
//

import SwiftUI
import MapKit
import Combine


struct BlackView: View {
    @EnvironmentObject var userData: UserData
    var body: some View {
        VStack(alignment: .leading) {
            Button(action: {
                userData.showSideMenu.toggle()
            }, label: {
                Text("").frame(minWidth: 0, maxWidth: userData.showSideMenu ? 120 : 0, minHeight: 0, maxHeight: .infinity).background(Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.6))
            })
            
        }.padding(.leading, -8).edgesIgnoringSafeArea(.all)
    }
}



struct MenuView: View {
    @EnvironmentObject var userData: UserData
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            ForEach(0..<K.menuItemText.count, id:\.self) { i in
                MenuItem(item: K.menuItemText[i])
            }
            Spacer()
            
        }.frame(minWidth: 0, maxWidth: userData.offset, minHeight: 0, maxHeight: .infinity).background(Color.white).edgesIgnoringSafeArea(.all)
    }
}


struct HomeView: View {
    @EnvironmentObject var userData: UserData
    var body: some View {
        ZStack(alignment: .topLeading) {
            
            MapView().padding(.leading,  userData.offset).ignoresSafeArea()
            
            MenuButtonView()
            BookLessonActivationView()
            
            HStack {
                MenuView()
                
                BlackView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(UserData())
    }
}
