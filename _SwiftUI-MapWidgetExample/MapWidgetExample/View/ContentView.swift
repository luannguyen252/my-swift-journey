//
//  ContentView.swift
//  MapWidgetExample
//
//  Created by Felix Mau on 15.10.20.
//  Copyright © 2020 Felix Mau. All rights reserved.
//

import SwiftUI
import CoreLocation

struct ContentView: View {
    var body: some View {
        VStack(spacing: 8) {
            Text("Nothing to see here.")
                .font(.title)

            Text("Please allow access to location data and add the widget to your home screen.")
        }
        .multilineTextAlignment(.center)
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
