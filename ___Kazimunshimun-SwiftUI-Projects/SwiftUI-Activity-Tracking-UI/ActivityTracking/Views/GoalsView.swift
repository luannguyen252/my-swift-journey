//
//  GoalsView.swift
//  ActivityTracking
//
//  Created by Anik on 14/11/20.
//

import SwiftUI

struct GoalsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Goals")
                .font(.system(size: 22, weight: .semibold))
            ProgressWithGoalView(title: "50 workout", initial: 0, goal: 50, currentValue: 36, progressColor: .appSkyBlue)
            ProgressWithGoalView(title: "desired weight", initial: 55, goal: 61, currentValue: 58, progressColor: .appPurple, reverseGoal: true)
        }
    }
}

struct ProgressWithGoalView: View {
    let title: String
    let initial: Int
    let goal: Int
    let currentValue: Int
    let progressColor: Color
    var reverseGoal = false

    var body: some View {
        VStack(spacing: 4) {
            ProgressView(title, value: getCurrentPercentageValue(), total: 100)
                .accentColor(progressColor)
                .foregroundColor(Color.gray.opacity(0.5))
            HStack {
                Text("\(reverseGoal ? goal : initial)")
                Spacer()
                Text("\(reverseGoal ? initial : goal)")
            }
        }
    }
    
    func getCurrentPercentageValue() -> Double {
        let value = ((currentValue - initial) * 100) / (goal - initial)
        return Double(value)
    }
}
