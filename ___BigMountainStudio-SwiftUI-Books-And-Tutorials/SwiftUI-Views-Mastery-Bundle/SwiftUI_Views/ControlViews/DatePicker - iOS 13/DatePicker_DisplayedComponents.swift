//
//  DatePicker_DisplayedComponents.swift
//  100Views
//
//  Created by Mark Moeykens on 7/20/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct DatePicker_DisplayedComponents: View {
    @State private var justTime = Date()
    @State private var theDateAndTime = Date()
    
    var body: some View {
        VStack(spacing: 9) {
            Text("DatePicker")
                .font(.largeTitle)
            Text("Displayed Components")
                .foregroundColor(.gray)
            
            Text("Show date and time parts with displayedComponents.")
                .frame(maxWidth: .infinity)
                .padding().background(Color.yellow)
                .foregroundColor(.black)
            
            DatePicker("", selection: $justTime,
                       displayedComponents: .hourAndMinute)
            
            Text("Combine date and time with an array.")
                .padding().frame(maxWidth: .infinity)
                .background(Color.yellow)
                .foregroundColor(.black)
            
            DatePicker("", selection: $theDateAndTime,
                       displayedComponents: [.date, .hourAndMinute])
            }
            .font(.title)
            .labelsHidden() // Notice I can add this modifier to the parent to be applied to the children
    }
}

struct DatePicker_DisplayedComponents_Previews: PreviewProvider {
    static var previews: some View {
        DatePicker_DisplayedComponents()
    }
}
