//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct Text_ShowingDates: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("Text",
                       subtitle: "Showing Dates",
                       desc: "The Text view knows how to display dates and date ranges for the locale of the user.",
                       back: .green, textColor: .white)
            
            Text(Date(), style: Text.DateStyle.date)
            Text(Date(), style: Text.DateStyle.time)
            Text(Date().addingTimeInterval(-6000), style: .offset)
            Text(Date().addingTimeInterval(-6000), style: Text.DateStyle.relative)
            Text(Date().addingTimeInterval(-6000), style: Text.DateStyle.timer)
            Text(Date()...Date().addingTimeInterval(6000))
        }
        .font(.title)
    }
}

struct Text_ShowingDates_Previews: PreviewProvider {
    static var previews: some View {
        Text_ShowingDates()
    }
}
