//
//  SitUpButton.swift
//  Workout
//
//  Created by Luan Nguyen on 06/12/2020.
//

import SwiftUI

struct SitUpButton: View {
    // MARK: - PROPERTIES
    @StateObject var sitUpRobot = SitUpRobot()
    
    // MARK: - BODY
    var body: some View {
        Text("\(sitUpRobot.completedSitUps)")
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(Color(.white))
            .frame(width: 100, height: 100, alignment: .center)
            .background(Color(.systemYellow))
            .clipShape(Circle())
            .onTapGesture(perform: sitUpRobot.addOneSitUp)
            .onLongPressGesture(perform: sitUpRobot.resetSitUps)
    }
}
