//
//  SmartScheduleView.swift
//  SwiftUIAirConditionerController
//
//  Created by Luan Nguyen on 26/12/2020.
//

import SwiftUI

struct SmartScheduleView: View {
    var body: some View {
        HStack {
            Button(action: {
                print("Button Pressed!")
            }, label: {
                Image(systemName: "stopwatch")
                    .font(.title2)
                    .foregroundColor(.gray)
                
                Text("Set smart schedule")
                    .font(.system(size: 16, weight: .bold, design: .default))
                    .foregroundColor(Color.red)
            })
        }
    }
}
