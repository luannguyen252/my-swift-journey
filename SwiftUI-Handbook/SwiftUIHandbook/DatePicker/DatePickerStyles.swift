//
//  DatePickerStyles.swift
//  SwiftUIHandbook
//
//  Created by Luan Nguyen on 15/12/2020.
//

import SwiftUI

struct DatePickerStyles: View {
    // MARK: - PROPERTIES
    @State private var selectedDate = Date()
    
    // MARK: - BODY
    var body: some View {
        VStack {
            // 1. CompactDatePickerStyle()
            DatePicker("Compact Style:", selection: $selectedDate, displayedComponents: .date)
            Text("Your selected date: \(selectedDate)")
                .datePickerStyle(CompactDatePickerStyle())
            
            // 2. DefaultDatePickerStyle()
            DatePicker("Default Style:", selection: $selectedDate, displayedComponents: .date)
            Text("Your selected date: \(selectedDate)")
                .datePickerStyle(DefaultDatePickerStyle())
            
            // 3. FieldDatePickerStyle() is unavailable in iOS
            
            // 4. GraphicalDatePickerStyle()
            DatePicker("Graphical Style:", selection: $selectedDate, displayedComponents: .date)
            Text("Your selected date: \(selectedDate)")
                .datePickerStyle(GraphicalDatePickerStyle())
            
            // 5. StepperFieldDatePickerStyle() is unavailable in iOS
            
            // 6. WheelDatePickerStyle()
            DatePicker("Wheel Style:", selection: $selectedDate, displayedComponents: .date)
            Text("Your selected date: \(selectedDate)")
                .datePickerStyle(WheelDatePickerStyle())
        }
        .padding()
    }
}

// MARK: - PREVIEW
struct DatePickerStyles_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerStyles()
    }
}
