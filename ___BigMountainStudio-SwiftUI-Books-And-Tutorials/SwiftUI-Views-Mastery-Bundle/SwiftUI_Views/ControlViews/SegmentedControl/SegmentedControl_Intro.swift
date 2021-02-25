//
//  SegmentedControl_1_00.swift
//  100Views
//
//  Created by Mark Moeykens on 6/19/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct SegmentedControl_1_00 : View {
    @State private var dayNight = "day"
    @State private var tab = 1
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Segmented Control (Picker)").font(.largeTitle)
            Text("Introduction")
                .font(.title).foregroundColor(.gray)
            Text("Associate the segmented control with an @State variable that will control which segment is selected. The state variable will match each segment's tag value.")
                .frame(maxWidth: .infinity).padding(8)
                .background(Color.pink).foregroundColor(Color.white)
                .font(.title)
            
            Picker("", selection: $dayNight) {
                Text("Day").tag("day")
                Text("Night").tag("night")
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            Text("With Images:")
            
            Picker("", selection: $tab) {
                Image(systemName: "sun.min").tag(0)
                Image(systemName: "moon").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
        }
    }
}

struct SegmentedControl_1_00_Previews : PreviewProvider {
    static var previews: some View {
        SegmentedControl_1_00()
    }
}
