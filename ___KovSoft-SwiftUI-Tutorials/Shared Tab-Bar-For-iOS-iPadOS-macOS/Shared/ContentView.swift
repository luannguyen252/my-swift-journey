//
//  ContentView.swift
//  Shared
//
//  Created by Balaji on 11/01/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
        // Always Light Mode...
            .preferredColorScheme(.light)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 8")
            
    }
}

// Setting Plain Styles For ALl Text Fields And Buttons...
