//
//  ContentView.swift
//  Gestures
//
//  Created by Luan Nguyen on 10/12/2020.
//

import SwiftUI

struct ContentView: View {
    // MARK: - BODY
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Single Finger Gestures")) {
                    NavigationLink(destination: Tap()) { Text("Tap Gesture")}
                    NavigationLink(destination: LongPress()) { Text("Long Press Gesture")}
                    NavigationLink(destination: Drag()) { Text("Drag Gesture")}
                }
                Section(header: Text("Multiple Finger Gestures")) {
                    NavigationLink(destination: Rotation()) { Text("Rotation Gesture")}
                    NavigationLink(destination: Magnification()) { Text("Magnification Gesture")}
                }
                Section(header: Text("Composed Gestures")) {
                    NavigationLink(destination: Simultaneous()) { Text("Simultaneous Gesture")}
                    NavigationLink(destination: Exclusive()) { Text("Exclusive Gesture")}
                    NavigationLink(destination: Sequence()) { Text("Sequence Gesture")}
                }
            }
        }
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
