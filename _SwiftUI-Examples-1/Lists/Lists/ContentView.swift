//
//  ContentView.swift
//  Lists
//
//  Created by Luan Nguyen on 15/01/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                NavigationLink(destination: DeleteExample()) {
                    Text("DeleteExample")
                }
                
                NavigationLink(destination: DynamicItemExample()) {
                    Text("DynamicItemExample")
                }
                
                NavigationLink(destination: MoveExample()) {
                    Text("MoveExample")
                }
                
                NavigationLink(destination: StaticItemExample()) {
                    Text("StaticItemExample")
                }
                .navigationBarTitle("Lists")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
