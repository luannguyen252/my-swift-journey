//
//  ContentView.swift
//  newxcode
//
//  Created by Sergey Sevriugin on 08/09/20.
//

import SwiftUI
import MapKit
import Combine

import NavigationStack


struct HomeView: View {
    @EnvironmentObject var userData: UserData
    
    @ViewBuilder
    var body: some View {
        NavigationStackView {
            
            ZStack(alignment: .topLeading) {
                
                MapView().ignoresSafeArea()
                
                MenuButtonView()
                BookLessonActivationView()
                
                HStack {
                    MenuView()
                    
                    BlackView()
                }
            }.preferredColorScheme(.light)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(UserData())
    }
}
