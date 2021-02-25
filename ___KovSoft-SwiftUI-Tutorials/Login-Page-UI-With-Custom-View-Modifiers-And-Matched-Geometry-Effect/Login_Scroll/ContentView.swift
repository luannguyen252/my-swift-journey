//
//  ContentView.swift
//  Login_Scroll
//
//  Created by Balaji on 18/10/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {

        NavigationView{
            
            Login()
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
