//
//  SwiftUIView.swift
//  SwiftUIAirConditionerController
//
//  Created by Luan Nguyen on 26/12/2020.
//

import SwiftUI

struct TemperatureView: View {
    @Binding var temperature: Int
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        VStack(alignment: .leading) {
            Text("Temperature,°C")
                .font(.system(size: 16, weight: .bold, design: .default))
                .foregroundColor(colorScheme == .dark ? Color.gray : Color.white)
            
            Text("\(temperature)")
                .font(.system(size: 80, weight: .heavy, design: .default))
                .foregroundColor(colorScheme == .dark ? Color.black : Color.white)
        }
        
    }
}
