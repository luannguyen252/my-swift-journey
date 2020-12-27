//
//  SpeedTextView.swift
//  SwiftUIVPNApp2
//
//  Created by Luan Nguyen on 27/12/2020.
//

import SwiftUI

struct SpeedTextView: View {
    @ObservedObject var speedSimulator: SpeedSimultor
    
    var body: some View {
        ZStack {
            EmitterView(width: UIScreen.screenWidth, height: 80)
                .opacity(speedSimulator.start ? 1.0 : 0.0)
                .frame(height: 80)
            
            VStack {
                Text(String(format: "%.2f", speedSimulator.calculatedSpeed))
                    .font(.system(size: 48, weight: .heavy))
                    .animation(.none)
                
                Text("mb/s")
                    .font(.system(size: 24, weight: .light))
            }
        }
    }
}

