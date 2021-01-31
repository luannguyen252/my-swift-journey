//
//  PullUpButton.swift
//  Workout
//
//  Created by Luan Nguyen on 06/12/2020.
//

import SwiftUI

struct PullUpButton: View {
    // MARK: - PROPERTIES
    @StateObject var pullUpRobot = PullUpRobot()
    
    // MARK: - BODY
    var body: some View {
        Text("\(pullUpRobot.completedPullUps)")
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(Color(.white))
            .frame(width: 100, height: 100, alignment: .center)
            .background(Color(.systemBlue))
            .clipShape(Circle())
            .onTapGesture(perform: pullUpRobot.addOnePullUp)
            .onLongPressGesture(perform: pullUpRobot.resetPullUps)
    }
}
