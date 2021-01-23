//
//  ContentView.swift
//  Tmall
//
//  Created by panzhijun on 2019/8/23.
//  Copyright © 2019 panzhijun. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var showGreeting = true

      var body: some View {
             NavigationView {
                 VStack {
                     NavigationLink(destination: DetailView()) {
                         Text("Show Detail View")
                     }.navigationBarTitle("Navigation")
                 }
             }
         }
}
struct DetailView: View {
    var body: some View {
        Text("This is the detail view")
    }
}
#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
