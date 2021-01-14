//
//  SegmentedControlView.swift
//  UIControls
//
//  Created by Sud on 6/16/19.
//  Copyright © 2019 MyCompany. All rights reserved.
//

import SwiftUI

let segmentedControlItems = [SegmentedControlItem(id: "1",
                                                  displayNames: ["Bike", "Train", "Car"],
                                                  displayType: .image),
                             SegmentedControlItem(id: "2",
                                                  displayNames: ["Bike", "Train", "Car"],
                                                  displayType: .text),
                             SegmentedControlItem(id: "3",
                                                  displayNames: ["🚲", "🚄", "🚘"],
                                                  displayType: .text)]

struct SegmentedControlItem: Identifiable {
    var id: String
    var displayNames: [String]
    var displayType: DisplayType
    
    enum DisplayType: String {
        case text
        case image
    }
}

struct SegmentedControlView : View {
    
    var body: some View {
        Form {
            Section(header: Text("Images"), content: {
                SegmentedControlRow(segmentedControlItem: segmentedControlItems[0])
            })
            Section(header: Text("Text"), content: {
                SegmentedControlRow(segmentedControlItem: segmentedControlItems[1])
            })
            Section(header: Text("Unicode Text"), content: {
                SegmentedControlRow(segmentedControlItem: segmentedControlItems[2])
            })
        }.navigationBarTitle(Text("Segmented Control"))
    }
}

struct SegmentedControlRow : View {
    var segmentedControlItem: SegmentedControlItem
    @State var selectedSegment = 0
    
    var body: some View {
        Picker("", selection: $selectedSegment) {
            ForEach(0..<segmentedControlItem.displayNames.count) { index in
                if self.segmentedControlItem.displayType == .image {
                    Image(self.segmentedControlItem.displayNames[index]).tag(index)
                }
                else {
                    Text(self.segmentedControlItem.displayNames[index]).tag(index)
                }
            }
        }
        .pickerStyle(SegmentedPickerStyle())
    }
}

#if DEBUG
struct SegmentedControlView_Previews : PreviewProvider {
    static var previews: some View {
        SegmentedControlView()
    }
}
#endif


