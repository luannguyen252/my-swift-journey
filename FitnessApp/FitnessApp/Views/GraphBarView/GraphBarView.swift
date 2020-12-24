//
//  GraphBarView.swift
//  FitnessApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct GraphBarView: View {
    // MARK: - PROPERTIES
    @ObservedObject var manager = DataManager()
    
    // MARK: - BODY
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "calendar.badge.clock")
                
                Text("Average")
                    .bold()
                
                Spacer()
            } //: HSTACK
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
                } //: HSTACK
                .font(.system(size: 12))
                .fixedSize()
                .frame(width: 20, height: 180)
                .rotationEffect(Angle.degrees(-90))
            } //; HSTACK
        } //: VSTACK
    }
    
    // MARK: - GET REALTIVe HEIGHT
    func getRealtiveHeight(value: CGFloat) -> CGFloat {
        var rHeight: CGFloat
        let availableHeight: CGFloat = 120
        let maxValue = bpms.map { $0.value }.max()!
        
        rHeight = (value/maxValue) * availableHeight
        
        return rHeight
    }
}
