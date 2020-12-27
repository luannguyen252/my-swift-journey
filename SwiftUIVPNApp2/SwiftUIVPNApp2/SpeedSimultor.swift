//
//  SpeedSimultor.swift
//  SwiftUIVPNApp2
//
//  Created by Luan Nguyen on 27/12/2020.
//

import SwiftUI

class SpeedSimultor: ObservableObject {
    @Published var progress: CGFloat = 0.0
    @Published var start = false
    
    let expectedRange = 35...40
    var calculatedSpeed: CGFloat = 0.0
    
    func startSpeedTest() {
        start.toggle()
        
        for i in Array(stride(from: 0, through: 60, by: 0.2)) {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i)) {
                if self.start {
                    self.calculateRandomSpeed()
                    self.calculateProgress()
                }
            }
        }
    }
    
    func calculateRandomSpeed() {
        let speed = Float(arc4random() % 8)
        
        if expectedRange.contains(Int(calculatedSpeed)) {
            if speed > 4 {
                calculatedSpeed += CGFloat(speed/5)
            } else {
                calculatedSpeed -= CGFloat(speed/5)
            }
        } else if calculatedSpeed > 40 {
            calculatedSpeed -= CGFloat(speed/6)
        } else {
            calculatedSpeed += CGFloat(speed/2)
        }
    }
    
    func calculateProgress() {
        withAnimation(.linear(duration: 0.2)) {
            progress = calculatedSpeed/125 + 0.1
        }
    }
}
