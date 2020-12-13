//
//  ContentView.swift
//  MyFirstWidget
//
//  Created by Luan Nguyen on 07/12/2020.
//

import SwiftUI

struct ContentView: View {
    // MARK: - BODY
    var body: some View {
        VStack(spacing: 30) {
            Text("Hello, iCoin 😎")
                .font(.title)
                .fontWeight(.black)
        }
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
