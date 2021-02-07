//
//  SeatView.swift
//  SeatingSwfitUI
//
//  Created by Simon Bachmann on 12.12.20.
//

import SwiftUI

struct SeatView: View {
    var selected: Bool
    var color: Color
    var available: Bool = true
    var fill: Bool = false

    var fillColor: Color {
        if !available || fill {
            return color
        } else if selected {
            return .green
        } else {
            return .clear
        }
    }

    var borderColor: Color {
        if selected {
            return .green
        } else {
            return color
        }
    }

    var body: some View {
        Rectangle()
                .fill(fillColor)
                .border(borderColor, width: 2)
                .cornerRadius(3)
    }
}
