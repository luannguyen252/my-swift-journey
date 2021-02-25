//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct DatePicker14_DisplayedComponents: View {
    @State private var date = Date()
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("DatePicker - iOS 14+",
                       subtitle: "Displayed Components",
                       desc: "You can show more than just a date. You can also show just the time or a combination of date and time.", back: .green)
            
            DatePicker("Today", selection: $date, displayedComponents: .hourAndMinute)
                .labelsHidden()
                .frame(height: 50)
                .padding(.horizontal)

            DatePicker("Today", selection: $date, displayedComponents: [.date, .hourAndMinute])
                .labelsHidden()
                .frame(height: 50)
                .padding(.horizontal)
        }.font(.title)
    }
}

struct DatePicker14_DisplayedComponents_Previews: PreviewProvider {
    static var previews: some View {
        DatePicker14_DisplayedComponents()
    }
}
