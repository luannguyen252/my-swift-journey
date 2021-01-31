//
//  WorkoutLabel.swift
//  Workout
//
//  Created by Luan Nguyen on 06/12/2020.
//

import SwiftUI

struct WorkoutLabel: View {
    // MARK: - PROPERTIES
    let label: String
    
    // MARK: - BODY
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
