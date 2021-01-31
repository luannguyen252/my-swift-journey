//
//  DatePickerAndTime.swift
//  SwiftUIHandbook
//
//  Created by Luan Nguyen on 15/12/2020.
//

import SwiftUI

struct DatePickerAndTime: View {
    // MARK: - PROPERTIES
    @State var selectedDate = Date()
    
    // MARK: - BODY
    var body: some View {
        DatePicker("Select event date and time", selection: $selectedDate, displayedComponents: [.date, .hourAndMinute])
    }
}

// MARK: - PREVIEW
struct DatePickerAndTime_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerAndTime()
    }
}
