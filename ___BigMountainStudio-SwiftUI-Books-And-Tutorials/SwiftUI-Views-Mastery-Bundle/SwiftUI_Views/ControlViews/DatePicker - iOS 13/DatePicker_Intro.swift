//
//  DatePicker_1_00.swift
//  100Views
//
//  Created by Mark Moeykens on 6/16/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct DatePicker_Intro : View {
    // The date picker will use this variable to get and set its value
    @State private var nextFullMoonDate = Date()
    
    var body: some View {
        VStack(spacing: 10) {
            Text("DatePicker").font(.largeTitle)
            Text("Introduction").foregroundColor(.gray)
            Text("Bind a date variable to get and set the date in the date picker.")
                .padding().frame(maxWidth: .infinity)
                .background(Color.yellow)
            
            HStack {
                Spacer()
                Image(systemName: "moon.circle")
                Spacer()
                Circle().frame(width: 60, height: 60.0)
                Spacer()
                Image(systemName: "moon.circle.fill")
                Spacer()
            }
            .foregroundColor(Color.yellow)
            
            DatePicker("", selection: $nextFullMoonDate,
                       displayedComponents: .date)

        }.font(.title)
    }
}

struct DatePicker_Intro_Previews : PreviewProvider {
    static var previews: some View {
        DatePicker_Intro()
    }
}
