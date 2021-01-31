//
//  DatePickersInForm.swift
//  SwiftUIHandbook
//
//  Created by Luan Nguyen on 15/12/2020.
//

import SwiftUI

struct DatePickersInForm: View {
    // MARK: - PROPERTIES
    @State var selectedDate = Date()
    
    // MARK: - BODY
    var body: some View {
        Form {
            DatePicker("When is your birthday?", selection: $selectedDate, displayedComponents: .date)
        }
    }
}

// MARK: - PREVIEW
struct DatePickersInForm_Previews: PreviewProvider {
    static var previews: some View {
        DatePickersInForm()
    }
}
