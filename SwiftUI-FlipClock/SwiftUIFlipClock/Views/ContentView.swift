//
//  ContentView.swift
//  SwiftUIFlipClock
//
//  Created by Luan Nguyen on 27/12/2020.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .center) {
            ClockView()
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
