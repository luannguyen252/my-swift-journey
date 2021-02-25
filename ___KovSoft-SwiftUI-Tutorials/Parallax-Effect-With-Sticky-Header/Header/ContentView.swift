//
//  ContentView.swift
//  Header
//
//  Created by Balaji on 14/10/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {

        NavigationView{
            Home()
                .preferredColorScheme(.dark)
                .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
