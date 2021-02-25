//
//  ContentView.swift
//  Shared
//
//  Created by Balaji on 17/02/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {

        NavigationView{
            Home()
                .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
