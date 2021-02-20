// SwiftUIPlayground
// https://github.com/ralfebert/SwiftUIPlayground/

import SwiftUI

/// Conditional DatePicker in SwiftUI
/// see https://stackoverflow.com/questions/61831882/swiftui-list-conditional-items-break-animations
struct ConditionalDatePickerView: View {

    @State var showDatePicker = false

    var body: some View {
        Form {
            Section(header: Text("Section 1")) {
                Toggle(isOn: $showDatePicker) {
                    Text("Show Date Picker")
                }
                if self.showDatePicker {
                    DatePicker(selection: .constant(Date()), label: { Text("Date") })
                }
            }
            Section(header: Text("Section 2")) {
                Text("Hello")
            }
        }
        .listStyle(GroupedListStyle())
    }
}

struct ConditionalDatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        ConditionalDatePickerView()
    }
}
