//
//  TimerView.swift
//  Ratios_SwiftUI
//
//  Created by Tarokh on 7/23/20.
//  Copyright © 2020 Tarokh. All rights reserved.
//

import SwiftUI

struct TimerView: View {
    
    // define some variables
    @State var timerDisplay = "00:00"
    @State var buttonText = "Start"
    @State private var timerState: TimerState = .paused
    @State private var totalSecond = 0
    private let timerModel = TimerModel()
    
    var body: some View {
        VStack(spacing: 10) {
            Text(self.timerDisplay)
                .fixedSize()
                .font(.system(size: 64))
                .onReceive(timerModel.timer) { (value) in
                    self.totalSecond += 1
                    let minutes = (self.totalSecond % 3600) / 60
                    let seconds = (self.totalSecond % 3600) % 60
                    self.timerDisplay = String(format: "%02d:%02d", minutes,seconds)
            }
            
            Button(action: runTimer) {
                Text(buttonText)
                    .font(.system(size: 20 ))
                .fixedSize()
                    .frame(width: 200, height: 52)
                .background(Color("Primary"))
                    .foregroundColor(.white)
                .cornerRadius(10)
            }
            
            Button(action: {
                self.timerState = .paused
                self.timerModel.stop()
                self.buttonText = "Start"
                self.totalSecond = 0
                self.timerDisplay = "00:00"
            }) {
                Text("Reset")
                .fixedSize()
                    .font(.system(size: 17))
                .foregroundColor(Color("Primary"))
            }
        }
    }
    
    // define some functions
    private func runTimer() {
        switch timerState {
        case .running:
            timerModel.stop()
            buttonText = "Start"
            timerState = .paused
        case .paused:
            timerModel.start()
            buttonText = "Pause"
            timerState = .running
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
