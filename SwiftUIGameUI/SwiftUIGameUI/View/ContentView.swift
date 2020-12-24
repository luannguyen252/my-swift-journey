//
//  ContentView.swift
//  SwiftUIGameUI
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Home()
                .navigationBarTitle("", displayMode: .inline)
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
