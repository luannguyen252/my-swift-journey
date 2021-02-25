//
//  StepCountManager.swift
//  StepCounter
//
//  Created by Anik on 18/8/20.
//

import SwiftUI

class StepCountManager: ObservableObject {
    @Published var stepData: StepData = StepData(goal: 6000)
    @Published var statData = data
    @Published var goalPercentage: CGFloat = 0.0
    @Published var start: Bool = false
    func updateData() {
        start.toggle()
        for i in 1...45 {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i)) {
                if self.start {
                    let steps: Int = Int(arc4random() % 300)
                    withAnimation(Animation.linear(duration: 0.5)) {
                        self.updateStepCount(steps: steps)
                    }
                }
            }
        }
    }
    
    func updateStepCount(steps: Int) {
        if stepData.count + steps < stepData.goal {
            stepData.count += steps
        } else {
            stepData.count = stepData.goal
            start = false
        }
        
        calculateStats()
    }
    
    func calculateStats() {
        stepData.mileCount = CGFloat(stepData.count) * 0.00029
        stepData.caloryCount = Int(CGFloat(stepData.count) * 0.036)
        stepData.minuteCount = Int(CGFloat(stepData.count) * 0.0075)
        
        goalPercentage = CGFloat(stepData.count)/CGFloat(stepData.goal)
        
        statData[0].value = String.init(format: "%.2f", stepData.mileCount)
        statData[1].value = "\(stepData.caloryCount)"
        statData[2].value = "\(stepData.minuteCount)\u{1D0D}"
    }
}
