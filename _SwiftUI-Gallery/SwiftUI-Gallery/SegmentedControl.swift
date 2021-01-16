//
//  SegmentedControl.swift
//  SwiftUI-Gallery
//
//  Created by Luan Nguyen on 16/01/2021.
//

import SwiftUI

struct SegmentedControl: View {
    static let ageRanges = ["1-10", "11-18", "18-55", "55+"]
    @State var selectedAgeRange = 0
    
    var body: some View {
        Picker(selection: $selectedAgeRange, label: Text("Range:")) {
            ForEach(0 ..< Self.ageRanges.count) {
                Text(Self.ageRanges[$0])
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding()
    }
}

struct SegmentedControl_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedControl()
    }
}
