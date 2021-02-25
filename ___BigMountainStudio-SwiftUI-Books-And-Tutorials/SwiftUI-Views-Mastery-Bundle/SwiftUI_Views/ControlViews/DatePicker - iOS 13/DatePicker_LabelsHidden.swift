//
//  DatePicker_HideLabels.swift
//  SwiftUI_Views
//
//  Created by Mark Moeykens on 10/5/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct DatePicker_LabelsHidden: View {
    @State private var nextFullMoonDate = Date()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("DatePicker")
                .font(.largeTitle)
            
            Text("Labels Hidden")
                .foregroundColor(.gray)
            
            Text("You use the .labelsHidden modifier to let SwiftUI know not to render or reserve space for the label (title).")
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.yellow)
            
            VStack(spacing: 0) {
                Text("Date of next full moon")
                DatePicker("Select a date for next full moon",
                           selection: $nextFullMoonDate,
                           displayedComponents: .date)
                .labelsHidden() // Hide the label/title
            }
        }
        .font(.title)
    }
}

struct DatePicker_LabelsHidden_Previews: PreviewProvider {
    static var previews: some View {
        DatePicker_LabelsHidden()
    }
}
