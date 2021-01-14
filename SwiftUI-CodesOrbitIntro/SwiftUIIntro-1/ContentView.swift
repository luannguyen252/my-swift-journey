//
//  ContentView.swift
//  SwiftUIIntro-1
//
//  Created by Umer Khan on 19/10/2020.
//

import SwiftUI

struct FlowersListView: View {
    
    let flowers = allFlowers
    
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FlowersListView()
    }
}
