//
//  SegmentedControl_Colors.swift
//  100Views
//
//  Created by Mark Moeykens on 7/18/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct SegmentedControl_Colors: View {
    @State private var selection = 2
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Segmented Control (Picker)").font(.largeTitle)
            Text("Colors")
                .font(.title).foregroundColor(.gray)
            Text("You can change the color of segmented controls by using the background modifier.")
                .frame(maxWidth: .infinity).padding()
                .background(Color.pink).foregroundColor(Color.white)
                .font(.title)
            
            Text("When you add a color, notice the corners:").font(.title).layoutPriority(1)
            Picker("", selection: $selection) {
                Text("One").tag(1)
                Text("Two").tag(2)
                Text("Three").tag(3)
            }
            .pickerStyle(SegmentedPickerStyle())
            .background(Color.pink)
            .padding(.horizontal)
            
            Text("Adding a corner radius should handle it:").font(.title).layoutPriority(1)
            Picker("", selection: $selection) {
                Text("One").tag(1)
                Text("Two").tag(2)
                Text("Three").tag(3)
            }
            .pickerStyle(SegmentedPickerStyle())
            .background(Color.pink)
            .cornerRadius(8)
            .padding(.horizontal)
        }
    }
}

struct SegmentedControl_Colors_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedControl_Colors()
    }
}
