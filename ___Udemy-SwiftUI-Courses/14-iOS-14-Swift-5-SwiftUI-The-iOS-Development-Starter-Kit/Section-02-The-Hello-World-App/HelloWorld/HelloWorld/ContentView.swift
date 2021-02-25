//
//  ContentView.swift
//  HelloWorld
//
//  Created by Pao Yu on 2020-07-03.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
            .fontWeight(.bold)
            .font(.title)
            .frame(width: 1000, height: 1000)
            .background(Color(.systemBlue))
            .foregroundColor(Color(.white))
    }
}
