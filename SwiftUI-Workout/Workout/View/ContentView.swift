//
//  ContentView.swift
//  Workout
//
//  Created by Luan Nguyen on 06/12/2020.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    
    // MARK: - BODY
    var body: some View {
        VStack {
            VStack {
                PushUpButton()
                WorkoutLabel(label: "PUSH-UPS")
            } //: VSTACK
            HStack(spacing: 75) {
                VStack {
                    PullUpButton()
                    WorkoutLabel(label: "PULL-UPS")
                }
                VStack {
                    SitUpButton()
                    WorkoutLabel(label: "SIT-UPS")
                }
            } //: HSTACK
        }
    }
}
