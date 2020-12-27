//
//  StartStopButtonView.swift
//  SwiftUIVPNApp2
//
//  Created by Luan Nguyen on 27/12/2020.
//

import SwiftUI

struct StartStopButtonView: View {
    @ObservedObject var speedSimulator: SpeedSimultor
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 56)
                .fill(speedSimulator.start ? Color.stopColor : Color.startColor)
                .frame(width: 120, height: 56)
            
            HStack {
                Image(systemName: "power")
                    .font(.system(size: 24, weight: .black))
                Text(speedSimulator.start ? "Stop" : "Start")
                    .font(.system(size: 18, weight: .regular))
            }
            .foregroundColor(speedSimulator.start ? .black : .white)
        }
    }
}
