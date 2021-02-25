//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct DatePicker14_Intro: View {
    @State private var date = Date()
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("DatePicker - iOS 14+",
                       subtitle: "Introduction",
                       desc: "The DatePicker in iOS 14 renders differently from the previous DatePicker.", back: .green)
            
            Text("Default style pulls in:")
            
            DatePicker("Today", selection: $date, displayedComponents: .date)
                .labelsHidden()
                .datePickerStyle(CompactDatePickerStyle())
                .padding(.horizontal)
            
            Text("With label:")
            
            DatePicker("Today", selection: $date, displayedComponents: .date)
                .padding(.horizontal)
            
        }.font(.title)
    }
}

struct DatePicker14_Intro_Previews: PreviewProvider {
    static var previews: some View {
        DatePicker14_Intro()
    }
}
