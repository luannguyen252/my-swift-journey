//
//  ContentView.swift
//  APICall-SwiftUI
//
//  Created by Keerthi on 27/08/20.
//  Copyright © 2020 Hxtreme. All rights reserved.
//

import SwiftUI

class UserSettings: ObservableObject {
    @Published var score = 0
}

struct ContentView: View {
    @EnvironmentObject var settings: UserSettings

    var body: some View {
        NavigationView {
            VStack(spacing: 20.0) {
                // A button that writes to the environment settings
                Button(action: {
                    self.settings.score += 1
                    print(self.settings.score)
                }) {
                    Text("Increase Score")
                }
                
                NavigationLink(destination: DetailView1()) {
                    Text("Show Detail View")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct DetailView1: View {
    @EnvironmentObject var settings: UserSettings

    var body: some View {
        // A text view that reads from the environment settings
        Text("Score: \(settings.score)")
    }
}
