//
//  PushUpButton.swift
//  Workout
//
//  Created by Luan Nguyen on 06/12/2020.
//

import SwiftUI

struct PushUpButton: View {
    // MARK: - PROPERTIES
    @StateObject var pushUpRobot = PushUpRobot()
    
    // MARK: - BODY
    var body: some View {
        Text("\(pushUpRobot.completedPushUps)")
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(Color(.white))
            .frame(width: 100, height: 100, alignment: .center)
            .background(Color(.systemRed))
            .clipShape(Circle())
            .onTapGesture(perform: pushUpRobot.addOnePushUp)
            .onLongPressGesture(perform: pushUpRobot.resetPushUps)
    }
}
