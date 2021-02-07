//
//  ContentView.swift
//  Shared
//
//  Created by Simon Bachmann on 12.12.20.
//

import SwiftUI
import PartialSheet

struct ContentView: View {
    @State var offset: CGFloat = 0

    var body: some View {
        ZStack {
            VStack {
                LegendView().padding()
                SeatingChartView()
            }
            PartialModalView(offset: $offset) {
                CheckoutView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
