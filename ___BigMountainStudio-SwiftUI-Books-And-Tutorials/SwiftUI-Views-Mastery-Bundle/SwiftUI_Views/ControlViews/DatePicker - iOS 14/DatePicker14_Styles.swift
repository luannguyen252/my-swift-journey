//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct DatePicker14_Styles: View {
    @State private var date = Date()
    
    var body: some View {
        VStack(spacing: 0) {
            HeaderView("DatePicker - iOS 14+",
                       subtitle: "Styles",
                       desc: "Graphical Style", back: .green)
            
            DatePicker("Birthday", selection: $date, displayedComponents: .date)
                .datePickerStyle(GraphicalDatePickerStyle())
                .padding(34)
            
            DescView(desc: "Wheel Style", back: .green)
            DatePicker("Birthday", selection: $date, displayedComponents: .date)
                .datePickerStyle(WheelDatePickerStyle())
                .labelsHidden()
            
        }
        .font(.title)
        .ignoresSafeArea(edges: .bottom)
    }
}

struct DatePicker14_Styles_Previews: PreviewProvider {
    static var previews: some View {
        DatePicker14_Styles()
    }
}
