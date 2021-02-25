//
//  ContentView.swift
//  Pomodoro
//
//  Created by Pao Yu on 2020-07-14.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack {
            VStack {
                TimeBar()
                TimeLabel()
            }
            HStack(spacing: 30) {
                TimeButton(systemName: "10.circle.fill", color: Color(.systemIndigo), time: 10)
                TimeButton(systemName: "25.circle.fill", color: Color(.systemBlue), time: 25)
                TimeButton(systemName: "50.circle.fill", color: Color(.systemPurple), time: 50)
            }
        }
    }
}
