//
//  PushUpLabel.swift
//  PushUpCounter
//
//  Created by Pao Yu on 2020-07-10.
//

import SwiftUI

struct WorkoutLabel: View {
    var body: some View {
        Text("Push-Ups")
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(Color(.black))
            .padding(.top, 20)
            .padding(.bottom, 20)
    }
}

struct PushUpLabel_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutLabel()
    }
}
