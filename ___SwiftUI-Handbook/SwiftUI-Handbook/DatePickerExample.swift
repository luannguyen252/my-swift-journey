import SwiftUI

struct DatePickerExample: View {
    @State var selectedDate = Date()
    
    var body: some View {
        VStack {
            DatePicker("Date", selection: $selectedDate)
            
            // Date Picker Wrapper
            DatePicker(selection: $selectedDate) {
                Text("Select a date")
                    .font(.title3)
            }
            
            // Date Range
            DatePicker("Range", selection: $selectedDate, in: ...Date())
            
            // Time Picker
            DatePicker("Time", selection: $selectedDate, displayedComponents: .hourAndMinute)
            
            // Date and Time
            DatePicker("Date and time", selection: $selectedDate, displayedComponents: [.date, .hourAndMinute])
            
            // Picking Date and Time
            DatePicker("Date and Time Picker", selection: $selectedDate, displayedComponents: [.date, .hourAndMinute])
            
            // GraphicalDatePickerStyle()
            DatePicker("Select date", selection: $selectedDate)
                .datePickerStyle(GraphicalDatePickerStyle())
        }
    }
}

#if DEBUG
struct DatePickerExample_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerExample()
    }
}
#endif
