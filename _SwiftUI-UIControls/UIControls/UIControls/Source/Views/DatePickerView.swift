//
//  DatePickerView.swift
//  UIControls
//
//  Created by Sud on 6/19/19.
//  Copyright © 2019 MyCompany. All rights reserved.
//

import SwiftUI

struct DatePickerView : View {
    @State var selectedDate = Date()
    @State var selectedDate1 = Date()
    
    var body: some View {
        List {
            Section {
                DatePicker(selection: $selectedDate, displayedComponents: [.hourAndMinute]) {
                    Text("Selected Date - \(selectedDate)")
                }
            }
            Section {
                DatePicker(selection: $selectedDate, displayedComponents: [.date]) {
                    Text("Selected Date - \(selectedDate)")
                }
            }
            Section {
                DatePicker(selection: $selectedDate, displayedComponents: [.date, .hourAndMinute]) {
                    Text("Selected Date - \(selectedDate)")
                }
            }
        }
        .navigationBarTitle(Text("Date Picker"))
    }
}

#if DEBUG
struct DatePickerView_Previews : PreviewProvider {
    static var previews: some View {
        DatePickerView()
    }
}
#endif
