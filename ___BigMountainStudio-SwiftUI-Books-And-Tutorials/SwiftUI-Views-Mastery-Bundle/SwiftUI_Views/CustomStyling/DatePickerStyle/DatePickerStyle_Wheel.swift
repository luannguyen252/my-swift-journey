//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct DatePickerStyle_Wheel: View {
    @State private var selectedDate = Date()
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("Date Picker Style", subtitle: "Wheel Style", desc: "As you probably saw from the chapter introducing date pickers, there is the wheel style too.",
                       back: .green)
                .font(.title)
            Text("WheelDatePickerStyle Applied:")
                .font(.title)
            DatePicker("WheelDatePickerStyle Applied:", selection: $selectedDate,
                       displayedComponents: .date)
                .datePickerStyle(WheelDatePickerStyle())
                .labelsHidden()
                .padding(.horizontal)
        }
        .minimumScaleFactor(0.5)
    }
}

struct DatePickerStyle_Wheel_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerStyle_Wheel()
    }
}
