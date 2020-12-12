//
//  ContentView.swift
//  MapView
//
//  Created by Luan Nguyen on 12/12/2020.
//

import SwiftUI
import MapKit

struct ContentView: View {
    // MARK: - PROPERTIES
    @State var manager = CLLocationManager()
    @State var alert = false
    
    // MARK: - BODY
    var body: some View {
        MapView(manager: $manager, alert: $alert).alert(isPresented: $alert) {
            Alert(title: Text("Please Enable Location Access in Settings."))
        }
        .edgesIgnoringSafeArea(.all)
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
