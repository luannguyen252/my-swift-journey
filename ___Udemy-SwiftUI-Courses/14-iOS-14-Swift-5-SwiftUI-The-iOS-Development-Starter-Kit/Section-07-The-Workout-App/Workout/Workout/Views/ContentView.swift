//
//  ContentView.swift
//  Workout
//
//  Created by Pao Yu on 2020-07-10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack {
            VStack {
                PushUpButton()
                WorkoutLabel(label: "PUSH-UPS")
            }
            HStack(spacing: 75) {
                VStack {
                    PullUpButton()
                    WorkoutLabel(label: "PULL-UPS")
                }
                VStack {
                    SitUpButton()
                    WorkoutLabel(label: "SIT-UPS")
                }
            }
        }
    }
}
