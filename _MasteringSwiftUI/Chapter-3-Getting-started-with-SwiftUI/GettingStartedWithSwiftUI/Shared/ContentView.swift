//
//  ContentView.swift
//  Shared
//
//  Created by Luan Nguyen on 02/01/2021.
//

import SwiftUI

struct ContentView: View {
    // MARK: - BODY
    var body: some View {
        VStack {
            Text("My first SwiftUI app")
                .foregroundColor(.purple)
                .padding()
                .font(.largeTitle)
            
            HStack {
                Text("That's awesome")
                
                Spacer()
                
                Text("Yeah")
            }
            .padding()
        }
    }
}

// MARK: - PREVIEW
#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
