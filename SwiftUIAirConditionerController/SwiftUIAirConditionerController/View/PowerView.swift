//
//  PowerView.swift
//  SwiftUIAirConditionerController
//
//  Created by Luan Nguyen on 26/12/2020.
//

import SwiftUI

struct PowerView: View {
    var body: some View {
        HStack {
            Button(action: {
                print("Button Pressed!")
            }, label: {
                Image(systemName: "power")
                    .font(.system(size: 24, weight: .black))
                    .foregroundColor(.red)
                
                Text("Turn Off")
                    .font(.system(size: 16, weight: .semibold, design: .default))
                    .foregroundColor(.gray)
            })
        }
        .padding(.bottom, 16)
    }
}
