//
//  SitUpButton.swift
//  Workout
//
//  Created by Pao Yu on 2020-07-10.
//

import SwiftUI

struct SitUpButton: View {
    
    @StateObject var sitUpRobot = SitUpRobot()
    
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
