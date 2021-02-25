//
//  WorkoutLabel.swift
//  Workout
//
//  Created by Pao Yu on 2020-07-10.
//

import SwiftUI

import SwiftUI

struct WorkoutLabel: View {
    
    let label: String
    
    var body: some View {
        Text(label)
            .font(.caption)
            .fontWeight(.bold)
            .foregroundColor(Color(.systemGray))
            .kerning(2)
            .padding(.top, 20)
            .padding(.bottom, 20)
    }
}
