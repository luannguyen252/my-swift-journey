// SwiftUIPlayground
// https://github.com/ralfebert/SwiftUIPlayground/

import SwiftUI

struct DatePickerExampleView: View {

    @State var date = Date()

    var body: some View {
        DatePicker(
            selection: $date,
            label: { Text("Date") }
        )
    }
}

struct DatePickerExampleView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerExampleView()
    }
}
