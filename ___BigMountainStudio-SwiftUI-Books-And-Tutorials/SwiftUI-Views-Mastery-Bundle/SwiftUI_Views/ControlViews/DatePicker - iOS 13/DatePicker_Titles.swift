//
//  DatePicker_Titles.swift
//  SwiftUI_Views
//
//  Created by Mark Moeykens on 10/5/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct DatePicker_Titles: View {
    @State private var nextFullMoonDate = Date()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("DatePicker").font(.largeTitle)
            Text("Titles").foregroundColor(.gray).font(.title)
            Text("You can provide an optional title for pickers.")
                .padding().frame(maxWidth: .infinity)
                .background(Color.yellow)
                .font(.title)
            
            // The first parameter is a label or title for the picker
            DatePicker("Date of next full moon", selection: $nextFullMoonDate,
                       displayedComponents: .date)
                .padding(.horizontal)
        }
    }
}

struct DatePicker_Titles_Previews: PreviewProvider {
    static var previews: some View {
        DatePicker_Titles()
    }
}
