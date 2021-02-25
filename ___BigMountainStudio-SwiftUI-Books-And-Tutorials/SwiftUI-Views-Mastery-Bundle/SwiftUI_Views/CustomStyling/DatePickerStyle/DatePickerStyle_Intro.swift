//
//  DatePickerStyle_Intro.swift
//  100Views
//
//  Created by Mark Moeykens on 9/12/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct DatePickerStyle_Intro: View {
    @State private var selectedDate = Date()
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("Date Picker Style", subtitle: "Introduction", desc: "You can't create a custom date picker style like you can with buttons. The date picker style applied will be different depending on the platform they are shown on or the parent they are contained within.",
                       back: .green)
                .font(.title)
            
            DatePicker("DefaultDatePickerStyle Applied:", selection: $selectedDate,
                       displayedComponents: .date)
                // Has no effect
                .datePickerStyle(DefaultDatePickerStyle())
                .padding(.horizontal)
        }
        .minimumScaleFactor(0.5)
    }
}

struct DatePickerStyle_Intro_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerStyle_Intro()
    }
}
