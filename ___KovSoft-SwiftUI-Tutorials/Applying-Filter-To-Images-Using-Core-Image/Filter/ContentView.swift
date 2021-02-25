//
//  ContentView.swift
//  Filter
//
//  Created by Balaji on 30/09/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {

        NavigationView{
            
            Home()
                // darkMode...
                .navigationBarTitle("Filter")
                .preferredColorScheme(.dark)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

