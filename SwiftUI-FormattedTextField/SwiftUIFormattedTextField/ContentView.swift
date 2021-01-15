//
//  ContentView.swift
//  SwiftUIFormattedTextField
//
//  Created by Toomas Vahter on 18.04.2020.
//  Copyright © 2020 Augmented Code. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                NavigationLink("TextField Internal Formatter", destination: makeView1())
                NavigationLink("TextField External Formatter", destination: makeView2())
            }.navigationBarTitle("Content")
        }
    }
    
    private func makeView1() -> FormatterView1 {
        let limits = TemperatureLimits()
        return FormatterView1(limits: limits)
    }
    
    private func makeView2() -> FormatterView2 {
        let limits = TemperatureLimits()
        return FormatterView2(limits: limits)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
