//
//  ProgressView.swift
//  SwiftUIVPNApp2
//
//  Created by Luan Nguyen on 27/12/2020.
//

import SwiftUI

struct ProgressView: View {
    @ObservedObject var speedSimulator: SpeedSimultor
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.progressBackgroundLinear, lineWidth: 24)
                .frame(width: 250, height: 250)
            
            Circle()
                .frame(width: 200, height: 200)
            
            ForEach(Array(stride(from: 0, through: 10, by: 1)), id: \.self) { i in
                Text("\(i * 10)")
                    .rotationEffect(.degrees(-120 - Double(i * 30)))
                    .offset(x: 160)
                    .rotationEffect(.degrees(Double(i * 30)))
            }
            .rotationEffect(.degrees(120))
            
            Circle()
                .trim(from: 0.1, to: speedSimulator.progress)
                .stroke(Color.progressLinear, style: StrokeStyle(lineWidth: 24, lineCap: .round))
                .frame(width: 250, height: 250)
                .rotationEffect(.degrees(90))
        }
    }
}
