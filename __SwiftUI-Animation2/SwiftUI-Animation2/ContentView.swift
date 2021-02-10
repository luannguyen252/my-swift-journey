//
//  ContentView.swift
//  SwiftUI-Animation2
//
//  Created by Luan Nguyen on 15/01/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                NavigationLink(destination: Spinner()) {
                    Text("Spinner")
                }
                NavigationLink(destination: DownloadButton()) {
                    Text("Download Button")
                }
                NavigationLink(destination: ShippingTruckView()) {
                    Text("Shipping Truck View")
                }
            }
            .navigationBarTitle("SwiftUI Animation 2")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
