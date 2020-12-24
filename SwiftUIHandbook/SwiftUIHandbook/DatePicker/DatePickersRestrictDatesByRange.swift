//
//  DatePickersRestrictDatesByRange.swift
//  SwiftUIHandbook
//
//  Created by Luan Nguyen on 15/12/2020.
//

import SwiftUI

struct DatePickersRestrictDatesByRange: View {
    // MARK: - PROPERTIES
    @State var selectedDate = Date()
    
    var closedRange: ClosedRange<Date> {
        let twoDaysAgo = Calendar.current.date(byAdding: .day, value: -2, to: Date())!
        let fiveDaysAgo = Calendar.current.date(byAdding: .day, value: -5, to: Date())!
        
        return fiveDaysAgo...twoDaysAgo
    }
    
    // MARK: - BODY
    var body: some View {
        // 1. In Range
        Form {
            DatePicker("Date Picker In Range", selection: $selectedDate, in: closedRange, displayedComponents: .date)
        }
        
        // 2. Past
        Form {
            DatePicker("Date Picker Past", selection: $selectedDate, in: ...Date(), displayedComponents: .date)
        }
        
        // 3. Present & Future
        Form {
            DatePicker("Date Picker Present & Future", selection: $selectedDate, in: Date()..., displayedComponents: .date)
        }
    }
}

// MARK: - PREVIEW
struct DatePickersRestrictDatesByRange_Previews: PreviewProvider {
    static var previews: some View {
        DatePickersRestrictDatesByRange()
    }
}
