//
//  ContentView.swift
//  SideBarBlog
//
//  Created by Thomas Prezioso on 9/18/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Sidebar()
            List(0 ..< 20) {_ in
                Text("Book")
            }
            .navigationTitle("Book List")
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
