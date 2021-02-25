//
//  GraphItemSelectionView.swift
//  ActivityTracking
//
//  Created by Anik on 14/11/20.
//

import SwiftUI

struct GraphItemSelectionView: View {
    @EnvironmentObject var manager: ActivityManager
    var body: some View {
        HStack(spacing: 40) {
            ForEach(manager.activities[0].caloryData) { data in
                ZStack(alignment: .bottom) {
                    Rectangle()
                        .fill(Color.black.opacity(0.0005))
                        .frame(width: 50)
                        .onTapGesture {
                            withAnimation {
                                manager.selectBar(hour: data.hour)
                            }
                    }
                    
                    Group {
                        VertialLine()
                            .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                            .frame(width: 1, height: getSelectedBarHeight(hour: data.hour))
                        
                        Circle()
                            .fill(Color.white)
                            .frame(width: 12, height: 12)
                            .offset(y : -getSelectedBarHeight(hour: data.hour) + 6)
                        
                        Circle()
                            .strokeBorder(Color.appBlue, lineWidth: 4)
                            .frame(width: 12, height: 12)
                            .offset(y : -getSelectedBarHeight(hour: data.hour) + 6)
                        
                        HStack {
                            Image(systemName: "flame")
                                .foregroundColor(.red)
                            Text(String.init(format: "%.0f", (getSelectedBarHeight(hour: data.hour) * 2.5)))
                        }
                        .font(.system(size: 12))
                        .offset(y : -getSelectedBarHeight(hour: data.hour) - 16)
                    }
                    .opacity(getIsBarSelected(hour: data.hour) ? 1.0 : 0.0)
                }
            }
        }
    }
    
    func getSelectedBarHeight(hour: String) -> CGFloat {
        var value: CGFloat = 0.0
        for item in manager.getCaloryDataForSelectedIndex() {
            if item.hour == hour {
                value = item.value
            }
        }
        return value / 2.5 // for height ratio
    }
    
    func getIsBarSelected(hour: String) -> Bool {
        var selected = false
        if manager.getSelectedActivityHour() == hour {
            selected = manager.getIsSelectedHourSelected()
        }
        return selected
    }
}
