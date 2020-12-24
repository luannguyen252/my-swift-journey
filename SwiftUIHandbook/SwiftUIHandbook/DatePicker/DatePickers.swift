//
//  DatePickers.swift
//  SwiftUIHandbook
//
//  Created by Luan Nguyen on 15/12/2020.
//

import SwiftUI

struct DatePickers: View {
    // MARK: - PROPERTIES
    @State var selectedDate = Date()
    
    // MARK: - BODY
    var body: some View {
        VStack {
            DatePicker("Select your date:", selection: $selectedDate, displayedComponents: .date)
            Text("Your selected date: \(selectedDate)")
        }
        .padding()
    }
}

// MARK: - PREVIEW
struct DatePickers_Previews: PreviewProvider {
    static var previews: some View {
        DatePickers()
    }
}
