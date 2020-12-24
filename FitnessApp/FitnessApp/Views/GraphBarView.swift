//
//  GraphBarView.swift
//  FitnessApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct GraphBarView: View {
    @ObservedObject var manager = DataManager()
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "calendar.badge.clock")
                Text("Average")
                    .bold()
                Spacer()
            }
            .foregroundColor(ColorConstants.textCircleSecendary)
            
            HStack(alignment: .bottom, spacing: 14) {
                ForEach(manager.bpmsValue) { bpm in
                    GraphCell(bpm: bpm, barHeight: getRealtiveHeight(value: bpm.value))
                        .onTapGesture {
                            withAnimation {
                                manager.selectData(bpm: bpm)
                            }
                        }
                }
                
                HStack {
                    Text("AVERAGE BPM: ")
                        .foregroundColor(ColorConstants.textCircleSecendary)
                    Text("Hours")
                        .bold()
                        .foregroundColor(.white)
                }
                .font(.system(size: 12))
                .fixedSize()
                .frame(width: 20, height: 180)
                .rotationEffect(Angle.degrees(-90))
            }
        }
    }
    
    func getRealtiveHeight(value: CGFloat) -> CGFloat {
        var rHeight: CGFloat
        let availableHeight: CGFloat = 120
        let maxValue = bpms.map { $0.value }.max()!
        rHeight = (value/maxValue) * availableHeight
        return rHeight
    }
}

struct GraphCell: View {
    let bpm: Models.BPM
    let barHeight: CGFloat
    
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
        }
    }
}
