//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct DatePickerStyle_Compact: View {
    @State private var selectedDate = Date()
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("Date Picker Style", subtitle: "Compact Style", desc: "Not much of a difference form the default style in iOS.",
                       back: .green)
                .font(.title)
            DatePicker("CompactDatePickerStyle Applied:", selection: $selectedDate,
                       displayedComponents: .date)
                .datePickerStyle(CompactDatePickerStyle())
                .padding(32)
        }
        .minimumScaleFactor(0.5)
    }
}

struct DatePickerStyle_Compact_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerStyle_Compact()
    }
}
