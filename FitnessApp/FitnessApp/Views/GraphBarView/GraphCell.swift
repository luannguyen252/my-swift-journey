//
//  GraphCell.swift
//  FitnessApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct GraphCell: View {
    // MARK: - PROPERTIES
    let bpm: Models.BPM
    let barHeight: CGFloat
    
    // MARK: - BODY
    var body: some View {
        VStack {
            Text(String.init(format: "%.0f", bpm.value))
                .font(.system(size: 14))
                .bold()
                .foregroundColor(bpm.selected ? Color.white : ColorConstants.textCircleSecendary)
            
            RoundedRectangle(cornerRadius: 10)
                .fill(bpm.selected ? ColorConstants.selectedColor : ColorConstants.graphUnselected)
                .frame(height: barHeight)
                .shadow(color: bpm.selected ? ColorConstants.selectedColor.opacity(0.5) : ColorConstants.graphUnselected.opacity(0.5), radius: 8)
            
            Text(bpm.time)
                .font(.system(size: 11))
                .foregroundColor(ColorConstants.textCircleSecendary)
        } //: VSTACK
    }
}
