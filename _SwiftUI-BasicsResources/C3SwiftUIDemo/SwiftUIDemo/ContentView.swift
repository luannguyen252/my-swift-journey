//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by Andreas Schultz on 07.10.20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 50) {
            VStack(alignment: .leading, spacing: 10) {
                Text("I love SwiftUI!")
                    .font(.largeTitle)
                    .foregroundColor(.blue)
                Text("SwiftUI makes developing iOS apps fun and easy")
            }
                .frame(width: 300, height: 150)
            Button(action: {
                //Show logo
            }) {
                Text("Show me the logo")
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
                    .foregroundColor(.white)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
