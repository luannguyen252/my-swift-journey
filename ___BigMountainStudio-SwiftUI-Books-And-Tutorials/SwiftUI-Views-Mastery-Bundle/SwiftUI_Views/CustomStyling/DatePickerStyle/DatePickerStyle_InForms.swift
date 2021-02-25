//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct DatePickerStyle_InForms: View {
    @State private var selectedDate = Date()
    
    var body: some View {
        VStack(spacing: 0) {
            HeaderView("Date Picker Style", subtitle: "In Forms", desc: "By default, pickers in a form are compact. Other styles:.",
                       back: .green)
                .font(.title)
            Form {
                Section(header: Text("Default")) {
                    DatePicker("Select:", selection: $selectedDate,
                               displayedComponents: .date)
                }
                Section(header: Text("WheelDatePickerStyle")) {
                    DatePicker("Select:", selection: $selectedDate,
                               displayedComponents: .date)
                        .labelsHidden()
                        .datePickerStyle(WheelDatePickerStyle())
                }
                Section(header: Text("Graphical")) {
                    DatePicker("Select:", selection: $selectedDate,
                               displayedComponents: .date)
                        .datePickerStyle(GraphicalDatePickerStyle())
                }
            }
        }
    }
}

struct DatePickerStyle_InForms_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerStyle_InForms()
    }
}
