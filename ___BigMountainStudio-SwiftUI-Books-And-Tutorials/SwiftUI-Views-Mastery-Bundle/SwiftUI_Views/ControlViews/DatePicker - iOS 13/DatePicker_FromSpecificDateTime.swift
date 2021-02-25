//
//  DatePicker_DateTimeFrom.swift
//  100Views
//
//  Created by Mark Moeykens on 7/21/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct DatePicker_FromSpecificDateTime: View {
    @State private var arrivalDate = Date()
    let fromToday = Calendar.current.date(byAdding: .minute,
                                          value: -1, to: Date())!
    let mainColor = Color("AccentColorDark")
    
    var body: some View {
        VStack(spacing: 20) {
            Text("DatePicker").font(.largeTitle)
            Text("From Date or Time").foregroundColor(.gray)
            Text("You can set a starting date or time with the date picker")
                .frame(maxWidth: .infinity).padding()
                .background(mainColor).foregroundColor(.white)
            Image("banff").resizable()
                .aspectRatio(contentMode: .fit)
            Text("Arrival Date")
            DatePicker("", selection: $arrivalDate, in: fromToday...,
                       displayedComponents: .date)
                .padding(.horizontal, 28)
                .background(RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(mainColor))
                .padding(.horizontal)
                .labelsHidden()
        }.font(.title)
    }
}

struct DatePicker_FromSpecificDateTime_Previews: PreviewProvider {
    static var previews: some View {
        DatePicker_FromSpecificDateTime()
    }
}
