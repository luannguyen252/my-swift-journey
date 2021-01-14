//
//  UIControlsListView.swift
//  UIControls
//
//  Created by Sud on 6/16/19.
//  Copyright © 2019 MyCompany. All rights reserved.
//

import SwiftUI

var uiControls = [UIControlItem(id: 1, displayName: "Segmented Control"),
                  UIControlItem(id: 2, displayName: "Toggle"),
                  UIControlItem(id: 3, displayName: "Text Field"),
                  UIControlItem(id: 4, displayName: "Slider"),
                  UIControlItem(id: 5, displayName: "Picker"),
                  UIControlItem(id: 6, displayName: "Date Picker"),
                  UIControlItem(id: 7, displayName: "Button"),
                  UIControlItem(id: 8, displayName: "Stepper"),
                  UIControlItem(id: 9, displayName: "Multiline Text"),
                  UIControlItem(id: 9, displayName: "Alert and Action Sheet")]

struct UIControlsListView : View {
    
    var body: some View {
        NavigationView {
            Form {
                NavigationLink(destination: SegmentedControlView()) {
                    Text(uiControls[0].displayName)
                }
                NavigationLink(destination: ToggleView()) {
                    Text(uiControls[1].displayName)
                }
                NavigationLink(destination: TextFieldView()) {
                    Text(uiControls[2].displayName)
                }
                NavigationLink(destination: SliderView()) {
                    Text(uiControls[3].displayName)
                }
                NavigationLink(destination: PickerView()) {
                    Text(uiControls[4].displayName)
                }
                NavigationLink(destination: DatePickerView()) {
                    Text(uiControls[5].displayName)
                }
                NavigationLink(destination: ButtonView()) {
                    Text(uiControls[6].displayName)
                }
                NavigationLink(destination: StepperView()) {
                    Text(uiControls[7].displayName)
                }
                NavigationLink(destination: MultilineTextView()) {
                    Text(uiControls[8].displayName)
                }
                NavigationLink(destination: AlertView()) {
                    Text(uiControls[9].displayName)
                }
            }
            .navigationBarTitle(Text("UI Controls"), displayMode: .inline)
        }
    }
}


struct UIControlItem: Identifiable {
    var id: Int
    var displayName: String
}


#if DEBUG
struct UIControlsListView_Previews : PreviewProvider {
    static var previews: some View {
        UIControlsListView()
    }
}
#endif
