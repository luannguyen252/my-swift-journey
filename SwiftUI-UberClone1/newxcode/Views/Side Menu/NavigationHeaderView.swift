//
//  NavigationHeaderView.swift
//  newxcode
//
//  Created by Sergey Sevriugin on 14/09/20.
//

import SwiftUI

import NavigationStack

struct NavigationHeaderView: View {
    @EnvironmentObject var userData: UserData
    
    var title: String
    var body: some View {
        
        Text(title).font(.title3).foregroundColor(.white).frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: .infinity, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 90, maxHeight: 90, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).background(Color(UIColor.backgroudColor)).edgesIgnoringSafeArea(.top)
        
        PopView {
            Image(systemName: "chevron.left").resizable().foregroundColor(.white).frame(width: 10, height: 18, alignment: .center)
        }.position(x: 20, y: 25).onDisappear {
            // userData.showSideMenu = false
        }
    }
}

struct NavigationHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        
        ZStack(alignment: .top) {
                
            Text("Settings").frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: .infinity, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: .infinity, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            NavigationHeaderView(title: "Settings").environmentObject(UserData())
        }.statusBar(style: .lightContent)
    }
}
