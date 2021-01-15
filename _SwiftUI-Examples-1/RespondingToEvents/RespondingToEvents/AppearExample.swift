//
//  AppearExample.swift
//  RespondingToEvents
//
//  Created by kim sunchul on 2020/05/07.
//  Copyright © 2020 kim sunchul. All rights reserved.
//

import SwiftUI

struct AppearExample: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: DetailView()) {
                Text("Hello World")
            }
        }.onAppear {
            print("ContentView appeared")
        }.onDisappear {
            print("ContentView disappeared")
        }
    }
}

struct DetailView:View {
    var body: some View {
        VStack {
            Text("Second View")
        }.onAppear {
            print("DetailView appeared!")
        }.onDisappear {
            print("DetailView disappeared!")
        }
    }
}

struct AppearExample_Previews: PreviewProvider {
    static var previews: some View {
        AppearExample()
    }
}
