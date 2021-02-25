//
//  TimeButton.swift
//  Pomodoro
//
//  Created by Pao Yu on 2020-07-14.
//

import SwiftUI

struct TimeButton: View {
    
    @EnvironmentObject var model: PomodoroModel
    
    let systemName: String
    let color: Color
    let time: Float
    
    var opacity: Double {
        if model.timerActive == true {
            return 0.3
        } else {
            return 1
        }
    }
    
    var body: some View {
        
        Image(systemName: systemName)
            .font(.largeTitle)
            .foregroundColor(color)
            .opacity(opacity)
            .onTapGesture() { self.model.runPomodoroTimer(time: time) }
            .onLongPressGesture(perform: model.resetPomodoroTimer)
        
    }
}
